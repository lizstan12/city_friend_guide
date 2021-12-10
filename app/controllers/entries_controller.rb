class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  # GET /entries
  def index
    @q = Entry.ransack(params[:q])
    @entries = @q.result(distinct: true).includes(:creator, :category,
                                                  :cityguide).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@entries.where.not(geo_location_latitude: nil)) do |entry, marker|
      marker.lat entry.geo_location_latitude
      marker.lng entry.geo_location_longitude
      marker.infowindow "<h5><a href='/entries/#{entry.id}'>#{entry.creator_id}</a></h5><small>#{entry.geo_location_formatted_address}</small>"
    end
  end

  # GET /entries/1
  def show; end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit; end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      message = "Entry was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @entry, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: "Entry was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    message = "Entry was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to entries_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def entry_params
    params.require(:entry).permit(:creator_id, :neighborhood, :cityguide_id,
                                  :geo_location, :category_id, :journal)
  end
end
