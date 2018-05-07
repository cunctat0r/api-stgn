class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    json_response(@posts)
  end

  def create
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  def destroy
    @post.destroy
    head :no_content
  end

private
  def post_params
    params.permit(:main_phone_number, :line_name, :num_tower)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
