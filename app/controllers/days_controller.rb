class DaysController < ApplicationController
  before_action :set_day, only: [:show, :update, :destroy]
  before_action :set_other, only: [:page, :create]
  # GET /days
  def index
    @days = Day.all

    render json: @days
  end

  def page
    @days = @trip.days.order("created_at")#.page(params[:page])
    render json: @days
  end

  # GET /days/1
  def show
    render json: @day
  end

  # POST /days
  def create
    @day = @trip.days.new(day_params)

    if @day.save
      render json: @day, status: :created, location: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /days/1
  def update
    if @day.update(day_params)
      render json: @day
    else
      render json: @day.errors, status: :unprocessable_entity
    end
  end

  # DELETE /days/1
  def destroy
    @day.destroy
    render :nothing, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other
      @trip = @user.trips.find(params[:tid])
    end

    def set_day
      @day = Day.find(params[:did])
    end

    # Only allow a trusted parameter "white list" through.
    def day_params
      params.require(:day).permit(:seq, :alias)
    end
end
