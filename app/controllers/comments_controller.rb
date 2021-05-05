class CommentsController < ApplicationController
  before_action :authenticate_user! # authenticate before anyone can comment who is not logged in.
  before_action :set_comment, only: [:edit, :update, :show, :destroy]
  before_action :set_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.create(params[:comment].permit(:reply, :post_id))
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.js # renders create.js.erb
      else
        format.html { redirect_to post_path(@post), notice: "Your comment did not save. Please try again." }
        format.js
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:reply)
  end

end