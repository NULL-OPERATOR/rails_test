class CommentsController < ApplicationController
  def new
    @resource = Resource.find(params[:resource_id])
    @comment = Comment.new
  end

  def create
    @resource = Resource.find(params[:resource_id])
    @resource.comments.create(comment_params)
  end

  def comment_params
    params.require(:review).permit(:thoughts, :rating)
  end
  
end
