class UsersController < ApplicationController
  # before_action :set_user, only: [:signin]

  def index
    @users = User.all
    render json: @users
  end

  def signin
    user_params = params.require(:user).permit(:email, :password)

    @user = User.find_by(email: user_params[:email])
    if @user.authenticate(user_params[:password])
      data = { :id => @user.id, :exp => Time.now.to_i + 30*86400 } # about 3 month
      @token = JsonWebToken.encode(data)
      render json: @token, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def signup
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      render nothing: true, status: :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find_by(email: params[:user][:email])
    end
end
