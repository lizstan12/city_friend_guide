class Api::V1::FollowersController < Api::V1::GraphitiController
  def index
    followers = FollowerResource.all(params)
    respond_with(followers)
  end

  def show
    follower = FollowerResource.find(params)
    respond_with(follower)
  end

  def create
    follower = FollowerResource.build(params)

    if follower.save
      render jsonapi: follower, status: :created
    else
      render jsonapi_errors: follower
    end
  end

  def update
    follower = FollowerResource.find(params)

    if follower.update_attributes
      render jsonapi: follower
    else
      render jsonapi_errors: follower
    end
  end

  def destroy
    follower = FollowerResource.find(params)

    if follower.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: follower
    end
  end
end
