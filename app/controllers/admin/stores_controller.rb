class Admin::StoresController < ApplicationController
  def index
    @stores = []
    @stores << Store.where(status: 'pending')
    @stores << Store.where(status: 'active')
    @stores << Store.where(status: 'denied')
  end
end
