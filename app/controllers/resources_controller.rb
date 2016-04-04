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
    if @resource.save
      redirect_to resources_path
    else
      render "new"
    end
  end

  def show
    @resource = find_resource(params[:id])
  end

  def edit
    @resource = find_resource(params[:id])
  end

  def update
    @resource = find_resource(params[:id])
    @resource.update(resource_params)

    redirect_to "/resources"
  end

  def destroy
    @resource = find_resource(params[:id])
    @resource.destroy
    flash[:notice] = "Resource deleted successfully"

    redirect_to "/resources"
  end

  private

  def find_resource(params)
    Resource.find(params)
  end

  def resource_params
    params.require(:resource).permit(:name)
  end
end
