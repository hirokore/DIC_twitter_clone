class PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.all
  end
  def index
    redirect_to new_post_path
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "ツイートされたった"
    else
      render :new
    end
  end
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
