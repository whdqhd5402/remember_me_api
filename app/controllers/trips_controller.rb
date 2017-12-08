class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]
  # GET /trips
  def index
    @trips = @user.trips
    render json: @trips
  end

  # GET /trips/page/1
  def page
    @trips = @user.trips.order("created_at DESC").page(params[:page])
    render json: @trips
  end

  # GET /trips/1
  def show
    render json: @trip
  end

  # POST /trips
  def create
    @trip = @user.trips.new(trip_params)

    if @trip.save
      render json: @trip, status: :created
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip, status: :no_content
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
    render :nothing, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:tid])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:title, :description, :region, :start, :end)
    end
end
