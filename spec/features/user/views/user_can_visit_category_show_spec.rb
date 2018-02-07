require 'rails_helper'
RSpec.describe "As a visitor can visit category show page" do
    before(:each) do
        Category.create(title: "Cats")
    end
    it "can visit category show page" do
        
        visit '/cats'
        
    end
end