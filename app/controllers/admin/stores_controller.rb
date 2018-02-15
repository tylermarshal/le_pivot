class Admin::StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def update
    @store = Store.find(params["id"])
    @store.update(store_params)
    redirect_to admin_stores_path
  end

  private

    def store_params
      params.permit(:id, :status)
    end
end
