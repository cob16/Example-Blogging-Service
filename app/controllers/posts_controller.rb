# CRUD actions for timeline posts
class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').limit(10_000)
  end
end
