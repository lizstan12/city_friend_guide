class Api::V1::CityListsController < Api::V1::GraphitiController
  def index
    city_lists = CityListResource.all(params)
    respond_with(city_lists)
  end

  def show
    city_list = CityListResource.find(params)
    respond_with(city_list)
  end

  def create
    city_list = CityListResource.build(params)

    if city_list.save
      render jsonapi: city_list, status: :created
    else
      render jsonapi_errors: city_list
    end
  end

  def update
    city_list = CityListResource.find(params)

    if city_list.update_attributes
      render jsonapi: city_list
    else
      render jsonapi_errors: city_list
    end
  end

  def destroy
    city_list = CityListResource.find(params)

    if city_list.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: city_list
    end
  end
end
