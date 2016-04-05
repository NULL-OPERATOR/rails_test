class ResourcesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(resource_params)
    return redirect_to resources_path if @resource.save
    render "new"
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
    redirect_to resources_path
  end

  def destroy
    @resource = find_resource(params[:id])
    @resource.destroy
    flash[:notice] = "Resource deleted successfully"
    redirect_to resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(:name)
  end
end
