class Admin::StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def update
    @store = Store.find(params[:id])
    @store.update(store_params)
    @store.save
    redirect_back(fallback_location: root_path)
  end

  private
    def store_params
      params.permit(:status, :id)
    end
end