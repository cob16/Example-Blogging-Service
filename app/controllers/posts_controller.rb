# CRUD actions for timeline posts
class PostsController < ApplicationController
  def index
    @posts = posts
  end

  def create
    post = Post.create(post_params)
    @posts = posts
    if post.save
      @success = 'Post succesfully submitted'
    else
      @errors = post.errors.full_messages unless post.save
    end

    render template: 'posts/index'
  end

  def destroy
    @post = Post.find(destroy_params['id'])
    @post.destroy if @post
    redirect_to({ action: :index }, notice: 'Succesfully deleted post')
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def destroy_params
    params.permit(:id)
  end

  def posts
    Post.order('created_at DESC').limit(10_000)
  end
end
