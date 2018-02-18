require 'rails_helper'

describe 'item search API' do
  context "HTTP GET" do
    it "returns a list of items based on the search term" do
      item_1 = create(:item, title: "Box of Candles")
      item_2 = create(:item, title: "Plant")
      item_3 = create(:item, title: "candle stick")
      item_4 = create(:item, title: "red book")

      user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
      role = Role.create(title: "registered_user")
      developer = Developer.create(user: user)

      user.roles << role

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get "/api/v1/search?type=items&q=candle&api_key=#{developer.api_key}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items["results"].count).to eq(2)
    end
    it "returns 404 without valid api key" do
      item_1 = create(:item, title: "Box of Candles")
      item_2 = create(:item, title: "Plant")
      item_3 = create(:item, title: "candle stick")
      item_4 = create(:item, title: "red book")

      user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
      role = Role.create(title: "registered_user")
      developer = Developer.create(user: user)

      user.roles << role

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get "/api/v1/search?type=items&q=candle&api_key=b4GOKm4pOYU_-BOXcrUGDg"

      expect(response).to_not be_successful
    end
  end
end

# GET "/api/v1/search?type=items&q=diapers&api_key=YOUR_REAL_KEY"
#
# The above query should return all items with a title or description containing the word "diapers"
# At some point we might want to allow searching other tables and but let's stick to only items for now.
#
# Return data should be JSON and like this:
# {
#   "type": "items",
#   "q": "diapers",
#   "results": [
#     {
#       "id": 1,
#       "title": "Nature's Diapers",
#       "description": "No chemicals or dyes. Also, they don't really work.",
#       "price": "$30.00"
#     },
#     {
#       "id": 103,
#       "title": "Dopo Tesigns Shoulder Bag",
#       "description": "Versitile bag great for commuting. Even makes as an excellent diaper bag. #dadcore #momcore",
#       "price": "$125.00"
#     }
#   ]
# }
#
# Possible ideas for searching multiple columns:
# - https://github.com/activerecord-hackery/squeel
# - https://github.com/activerecord-hackery/ransack
# - Don't forget about case insensitivity. Not sure if these gems handle it. If not, look into citext column types with Postgres.
