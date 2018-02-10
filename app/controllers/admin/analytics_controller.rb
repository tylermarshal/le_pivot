class Admin::AnalyticsController < ApplicationController

  def index
    @analytics = AdminAnalyticsPresenter.new
  end
end
