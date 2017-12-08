class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :update, :destroy]
  before_action :set_other, only: [:page, :create]

  # GET /spots
  def index
    @spots = Spot.all

    render json: JsonRes.success('',@spots)
  end

  def page
    @spots = @day.spots.order("created_at")#.page(params[:page])
    render json: JsonRes.success('',@spots)
  end

  # GET /spots/1
  def show
    render json: JsonRes.success('',@spot)
  end

  # POST /spots
  def create
    @spot = @day.spots.new(spot_params)

    if @spot.save
      render json: JsonRes.success('',@spot), status: :created, location: @spot
    else
      render json: JsonRes.errors('',@spot.errors), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spots/1
  def update
    if @spot.update(spot_params)
      render json: JsonRes.success('',@spot)
    else
      render json: JsonRes.errors('',@spot.errors), status: :unprocessable_entity
    end
  end

  # DELETE /spots/1
  def destroy
    @spot.destroy
    render json: JsonRes.destroy('spot',params[:sid]), status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other
      @day = @user.trips.find(params[:tid]).days.find(params[:did])
    end

    def set_spot
      @spot = Spot.find(params[:sid])
    end

    # Only allow a trusted parameter "white list" through.
    def spot_params
      params.require(:spot).permit(:subseq, :name, :destination, :memo, :start, :end)
    end
end
