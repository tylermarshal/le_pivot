class Stores::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

	def show
		@item = Item.find(params[:id])
		if params[:image_id].present?
			preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
			raise "Invalid upload signature" if !preloaded.valid?
			@item.image = preloaded.identifier
		end
	end
end
