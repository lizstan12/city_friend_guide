class Api::V1::CityGuidesController < Api::V1::GraphitiController
  def index
    city_guides = CityGuideResource.all(params)
    respond_with(city_guides)
  end

  def show
    city_guide = CityGuideResource.find(params)
    respond_with(city_guide)
  end

  def create
    city_guide = CityGuideResource.build(params)

    if city_guide.save
      render jsonapi: city_guide, status: :created
    else
      render jsonapi_errors: city_guide
    end
  end

  def update
    city_guide = CityGuideResource.find(params)

    if city_guide.update_attributes
      render jsonapi: city_guide
    else
      render jsonapi_errors: city_guide
    end
  end

  def destroy
    city_guide = CityGuideResource.find(params)

    if city_guide.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: city_guide
    end
  end
end
