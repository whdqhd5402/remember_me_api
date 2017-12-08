class UsersController < ApplicationController
  # before_action :set_user, only: [:signin]

  def index
    @users = User.all
    render json: JsonRes.success('',@users)
  end

  def signin
    user_params = {email: params[:email], password: params[:password]}
    @user = User.find_by(email: user_params[:email])

    if @user.authenticate(user_params[:password])
      data = { id: @user.id, exp: Time.now.to_i + 30*86400 } # about 1 month
      @token = JsonWebToken.encode(data)
      render json: JsonRes.token( 'token created', @token ), status: :ok
    else
      render json: JsonRes.errors('', @user.errors), status: :unprocessable_entity
    end
  end

  def signup
    user_params = {name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]}

    @user = User.new(user_params)
    if @user.save
      render json: JsonRes.success('user created', nil ), status: :ok #:no_content
    else
      render json: JsonRes.errors('This email is already', @user.errors ), status: :unprocessable_entity
    end
=begin
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
=end
  end
end
