class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def update
  end
end
