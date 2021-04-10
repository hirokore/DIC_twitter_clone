class PostsController < ApplicationController
  before_action :set_post,only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
    @posts = Post.all
  end

  def index
    redirect_to new_post_path
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      @posts = Post.all
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "ヅイートされたった"
      else
        render :new
      end
    end
  end

  def confirm
    @posts = Post.all
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"消しったー"
  end  

  def edit
    @posts = Post.all
  end

  def update
    @posts = Post.all
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

  def set_post
    @post = Post.find(params[:id])
  end
  
end
