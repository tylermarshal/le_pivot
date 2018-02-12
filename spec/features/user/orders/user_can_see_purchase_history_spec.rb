require 'rails_helper'

feature "a registered user can see their purchase history" do
  it "as a registered user" do
    user = create(:user)
    role = Role.create(title: "registered_user")
    user.roles << role
    order = create(:order, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/orders'

    expect(page).to have_content(order.id)
    expect(page).to have_content(order.date)
    expect(page).to have_content(order.status.capitalize)
    expect(page).to have_content(order.total_price)
  end
end