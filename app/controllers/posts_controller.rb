class PostsController < ApplicationController
  def list
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    if @post.save
     redirect_to root_path
    else
     redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
  end

  def update
  end

  def delete # WIP
    Post.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def post_params
    params.require(:post).permit!
  end
end
