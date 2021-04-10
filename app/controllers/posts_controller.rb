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
    @posts = Post.all
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  def destroy
    set_posts
    @post.destroy
    redirect_to posts_path, notice:"消しったー"
  end  
  def edit
    set_posts
    @posts =Post.all
  end
  def update
    set_posts
    if @post.update(post_params)
      redirect_to posts_path, notice: "いじったー"
    else
      render :edit
    end
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_posts
    @post = Post.find(params[:id])
  end
  
end
