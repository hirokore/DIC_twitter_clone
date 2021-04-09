class PostsController < ApplicationController
  def top
    @comment_new = Post.new
  end
  def create
    @comment_new = Post.new(post_params)
    if @comment_new.save
      redirect_to posts_path, notice: "ツイートされたった"
    else
      render :new
    end
  end
  def confirm
    @boot = Boot.new(boot_params)
    render :new if @boot.invalid?
  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
