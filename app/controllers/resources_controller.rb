class ResourcesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(resource_params)
    redirect_to '/resources'
  end

  def show
    @resource = Resource.find(params[:id])
  end

  private

  def resource_params
    params.require(:resource).permit(:name)
  end
end
