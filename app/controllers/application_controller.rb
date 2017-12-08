class ApplicationController < ActionController::API
  before_action :is_valid?, except: [:signin, :signup]
  before_action :set_user, only: [:index, :create]
  # before_action :set_user, except: [:signin, :signup, :update, :destroy]
  private
  def is_valid?
    begin
      @auth_token ||= request.headers.fetch("token", "")
      # ap @auth_token
      @dtoken = JsonWebToken.decode(@auth_token)
    rescue JWT::ExpiredSignature
      render json: {errors: 'This token was expired!'}, status: :unauthorized
    rescue JWT::DecodeError
      render json: {errors: 'Invalid data! Check your data again.'}, status: :bad_request
    end
  end

  def set_user
    @user = User.find(@dtoken.first["id"])
    if @user.nil?
      render json: {errors: 'You are not our users!'}, status: :forbidden
    end
  end
end
