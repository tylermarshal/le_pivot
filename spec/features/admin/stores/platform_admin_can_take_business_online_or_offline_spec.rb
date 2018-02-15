require 'rails_helper'

feature "Business can be taken online or offline" do
  let!(:platform_admin) {create(:user)}
  let!(:role)           {create(:role, title: "platform_admin")}
  let!(:online_store)   {create(:store, status: "online")}
  let!(:offline_store)  {create(:store, status: "offline")}

  before(:each) do
    platform_admin.roles << role    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(platform_admin)
  end

  context "by a valid platform admin" do
    it "an online store can be taken offline" do
      expect(online_store.status).to eq "online"

      visit admin_dashboard_index_path
      click_on "View Stores"
      within(".store-#{online_store.id}") do
        click_on("Take Offline")
      end
      
      online_store.reload

      expect(online_store.status).to eq "offline"
    end

    it "an offline store can be taken online" do
      expect(offline_store.status).to eq "offline"

      visit admin_dashboard_index_path
      click_on "View Stores"
      within(".store-#{offline_store.id}") do
        click_on("Take Online")
      end

      offline_store.reload

      expect(offline_store.status).to eq "online"
    end
  end
end