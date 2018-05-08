class MeasurementsController < ApplicationController
  before_action :set_post
  before_action :set_post_measurement, only: [:show, :update, :destroy]

  def index
    json_response(@post.measurements)
  end

  def show
    json_response(@measurement)
  end

  def create
    @post.measurements.create!(measurement_params)
     json_response(@post, :created)
  end

private

  def measurement_params
    params.permit(:Upit)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_measurement
    @measurement = @post.measurements.find_by!(id: params[:id]) if @post
  end

end
