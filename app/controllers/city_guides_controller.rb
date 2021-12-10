class CityGuidesController < ApplicationController
  before_action :set_city_guide, only: %i[show edit update destroy]

  def index
    @q = CityGuide.ransack(params[:q])
    @city_guides = @q.result(distinct: true).includes(:entries).page(params[:page]).per(10)
  end

  def show
    @entry = Entry.new
  end

  def new
    @city_guide = CityGuide.new
  end

  def edit; end

  def create
    @city_guide = CityGuide.new(city_guide_params)

    if @city_guide.save
      redirect_to @city_guide, notice: "City guide was successfully created."
    else
      render :new
    end
  end

  def update
    if @city_guide.update(city_guide_params)
      redirect_to @city_guide, notice: "City guide was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @city_guide.destroy
    redirect_to city_guides_url,
                notice: "City guide was successfully destroyed."
  end

  private

  def set_city_guide
    @city_guide = CityGuide.find(params[:id])
  end

  def city_guide_params
    params.require(:city_guide).permit(:entry_id)
  end
end
