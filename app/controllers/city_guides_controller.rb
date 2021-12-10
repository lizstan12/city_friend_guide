class CityGuidesController < ApplicationController
  before_action :set_city_guide, only: [:show, :edit, :update, :destroy]

  # GET /city_guides
  def index
    @city_guides = CityGuide.page(params[:page]).per(10)
  end

  # GET /city_guides/1
  def show
    @entry = Entry.new
  end

  # GET /city_guides/new
  def new
    @city_guide = CityGuide.new
  end

  # GET /city_guides/1/edit
  def edit
  end

  # POST /city_guides
  def create
    @city_guide = CityGuide.new(city_guide_params)

    if @city_guide.save
      redirect_to @city_guide, notice: 'City guide was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /city_guides/1
  def update
    if @city_guide.update(city_guide_params)
      redirect_to @city_guide, notice: 'City guide was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /city_guides/1
  def destroy
    @city_guide.destroy
    redirect_to city_guides_url, notice: 'City guide was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_guide
      @city_guide = CityGuide.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_guide_params
      params.require(:city_guide).permit(:entry_id)
    end
end
