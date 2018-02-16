# require "rails_helper"
#
# describe 'a user can make a purchase on Aroma Candles' do
#   before :each do
#     6.times do create(:store)
#     end
#   end
#   it "makes a purchase" do
#     Store.all.each do |store|
#       store.items << create(:item)
#     end
#     user = create(:user)
#     role = create(:role, title: "registered_user")
#     user.roles << role
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#
#     visit '/'
#
#     expect(page).to have_link "Aroma Candles"
#
#     click_on "Aroma Candles"
#     click_on "Add to cart"
#     click_on "Cart"
#     click_on "Checkout"
#
#     expect(page).to have_content "Order was successfully placed"
#     expect(current_path).to eq orders_path
#   end
# end
