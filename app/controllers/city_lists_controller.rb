class CityListsController < ApplicationController
  before_action :set_city_list, only: %i[show edit update destroy]

  def index
    @q = CityList.ransack(params[:q])
    @city_lists = @q.result(distinct: true).includes(:entries).page(params[:page]).per(10)
  end

  def show
    @entry = Entry.new
  end

  def new
    @city_list = CityList.new
  end

  def edit; end

  def create
    @city_list = CityList.new(city_list_params)

    if @city_list.save
      redirect_to @city_list, notice: "City list was successfully created."
    else
      render :new
    end
  end

  def update
    if @city_list.update(city_list_params)
      redirect_to @city_list, notice: "City list was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @city_list.destroy
    redirect_to city_lists_url, notice: "City list was successfully destroyed."
  end

  private

  def set_city_list
    @city_list = CityList.find(params[:id])
  end

  def city_list_params
    params.require(:city_list).permit(:city_id, :user_id)
  end
end
