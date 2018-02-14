require 'rails_helper'

feature "A store manager manages orders on their business" do
  scenario "as a valid store manager of a business" do
    it "they can see a single order for their business" do
    end

    it "they can see all orders for their business" do
    end

    it "they can't see orders for a business they don't manage" do
    end

    scenario "they can filter orders by status" do
      it "ordered" do
      end

      it "paid" do
      end

      it "completed" do
      end

      it "cancelled" do
      end

    end

    scenario "they can change status" do
      context "of a paid order" do
        it "to cancelled" do
        end

        it "to completed" do
        end
      end

      context "of a ordered order" do
        it "to cancelled" do
        end

        it "to paid" do
        end
      end
    end
  end
end