require 'rails_helper'

feature "a registered user can see their purchase history" do
  it "as a registered user" do
    user = create(:user)
    order = create(:order, user: user)
    binding.pry
    visit '/orders'

    expect()
  end
end