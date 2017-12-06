class UsersController < ApplicationController
  before_action :set_user, only: [:signin, :signout]

  def index
    @users = User.all
    render json: @users
  end

  def facebook_signin

  end

  def google_signin

  end

  def signin
    # @p = params.require(:user).permit(:email, :password)
#     hmac_secret = 'ccad3cb540896710d8357863052b63acbe02c4facacd88ea5667143f816abd2ccd9ae4d31090040bc9703027d352f72247095c1f
# d779bbb2259b0fadcb61b0df'

    ap params[:email]
    ap params[:password]
    if @user.authenticate(params[:password])
      data = { :id => @user.id, :exp => Time.now.to_i + 30*86400 } # about 3 month
      # ap User.new.hmac_secret
      @token = JWT.encode data, User.new.hmac_secret, 'HS256'
      # ap @token

      # @dtoken = JWT.decode @token, hmac_secret, true, {:algorithm => 'HS256'}
      # ap "id : #{@dtoken[0]["id"]}"

      render json: @token, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def signup
    # ap params[:name]
    # ap params[:email]
    # ap params[:password]
    # ap params[:password_confirmation]

    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def signout

    if @user.update(token: nil)
      render nothing: true
    else
      render @user.errors, status: :unprocessable_entity
    end

    # unless @user.token.nil?
    #   render json: @user.token, status: :accepted
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
  end

  private
    def set_user
      @user = User.find_by(email: params[:email])
    end
end
