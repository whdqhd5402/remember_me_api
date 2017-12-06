class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]
  before_action :is_valid?
  # GET /trips
  def index
    # @trips = Trip.all
    @trips = Trip.order("created_at DESC").page(params[:page])
    render json: @trips
  end

  # GET /trips/1
  def show
    render json: @trip
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def is_valid?
      begin
        # @dtoken = JWT.decode params[:token], User.hmac_secret, true, { :algorithm => 'HS256' }
        @dtoken = JsonWebToken.decode(params[:token])
        # ap "id : #{@dtoken[0]["id"]}"
      rescue JWT::ExpiredSignature
        # ap "expired date!"
        render json: @dtoken.errors, status: :unprocessable_entity
      end
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:title, :description, :region, :start, :end, :user_id)
    end
end
