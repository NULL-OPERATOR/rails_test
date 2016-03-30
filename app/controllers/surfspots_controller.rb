class SurfspotsController < ApplicationController
  def index
    @surfspots = Surfspot.all
  end

  def new
  end

  def create
    Surfspot.create(params[:surfspot])
    redirect_to '/surfspots'
  end
end
