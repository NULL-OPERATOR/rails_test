class CommentsController < ApplicationController
  def new
    @resource = Resource.find(params[:resource_id])
    @comment = Comment.new
  end

  def create
    @resource = Resource.find(params[:resource_id])
    @resource.comments.create(comment_params)

    redirect_to resources_path
  end

  def comment_params
    params.require(:comment).permit(:info, :rating)
  end

end
