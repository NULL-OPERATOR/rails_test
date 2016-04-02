class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
  end

  def create
    Resource.create(params[:resource])
    redirect_to '/resources'
  end
end
