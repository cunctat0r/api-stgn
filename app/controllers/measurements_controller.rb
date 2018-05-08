class MeasurementsController < ApplicationController
  before_action :set_post
  before_action :set_post_measurement, only: [:show, :update, :destroy]

  def index
    json_response(@post.measurements)
  end

private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
