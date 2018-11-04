class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path :notice => "Your post has been edited"
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
