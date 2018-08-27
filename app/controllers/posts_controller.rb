# CRUD actions for timeline posts
class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').limit(10_000)
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to({ action: :index }, notice: 'Succesfully posted')
    else
      redirect_to({ action: :index }, notice: 'Failed to Post', errors: @post.errors)
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
