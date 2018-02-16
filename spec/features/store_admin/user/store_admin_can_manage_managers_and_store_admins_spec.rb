require 'rails_helper'

feature 'Store admin can manage other store managers and store admins for your store' do

  let!(:store_admin) {create(:user)}
  let!(:store)       {create(:store)}
  let!(:sa_role)     {create(:role, title: "store_admin")}

  before(:each) do
    store_admin.roles << sa_role
    store_admin.stores << store
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)
  end


  context "as a valid store admin" do
    context "they can manage a store manager" do
      scenario "by making a user a store manager" do
        user = create(:user)

        expect(user.store_manager?).to be false

        visit admin_dashboard_index_path
        click_on "View Users"
        within(".user-#{user.id}") do
          click_on "Make Store Manager"
        end
        user.reload

        expect(user.store_manager?).to be true
      end
      scenario "by removing the store manager role from a user" do
        store_manager = create(:user)
        manager_role = create(:role, title: "store_manager")
        store_manager.roles << manager_role

        expect(store_manager.store_manager?).to be true

        visit admin_dashboard_index_path
        click_on "View Users"
        within(".user-#{store_manager.id}") do
         click_on "Remove Store Manager Role"
        end
        store_manager.reload

        expect(store_manager.store_manager?).to be false
      end
    end
    context "they can manage a store admin" do
      scenario "by making user a store admin" do
        user = create(:user)

        expect(user.store_admin?).to eq false

        visit admin_dashboard_index_path
        click_on "View Users"
        within(".user-#{user.id}") do
          click_on "Make Store Admin"
        end
        user.reload

        expect(user.store_admin?).to be true
      end
      scenario "by removing the store admin role from a user" do
        store_admin = create(:user)
        admin_role = create(:role, title: "store_admin")
        store_admin.roles << admin_role
        expect(store_admin.store_admin?).to be true

        visit admin_dashboard_index_path
        click_on "View Users"
        within(".user-#{store_admin.id}") do
          click_on "Remove Store Admin Role"
        end
        store_admin.reload

        expect(store_admin.store_admin?).to be false
      end
    end
  end
end
