class FollowersController < ApplicationController
  before_action :set_follower, only: %i[show edit update destroy]

  def index
    @q = Follower.ransack(params[:q])
    @followers = @q.result(distinct: true).includes(:sender,
                                                    :receiver).page(params[:page]).per(10)
  end

  def show; end

  def new
    @follower = Follower.new
  end

  def edit; end

  def create
    @follower = Follower.new(follower_params)

    if @follower.save
      message = "Follower was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @follower, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @follower.update(follower_params)
      redirect_to @follower, notice: "Follower was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @follower.destroy
    message = "Follower was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to followers_url, notice: message
    end
  end

  private

  def set_follower
    @follower = Follower.find(params[:id])
  end

  def follower_params
    params.require(:follower).permit(:sender_id, :receiver_id)
  end
end
