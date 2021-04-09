class PostsController < ApplicationController
  def top
    @comment_new = Post.new
  end
end
