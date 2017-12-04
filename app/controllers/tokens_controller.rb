class TokensController < ApplicationController
  before_action :set_token, only: [:show, :update, :destroy]

  # GET /tokens
  def index
    @tokens = Token.all

    render json: @tokens
  end

  # GET /tokens/1
  def show
    render json: @token
  end

  # POST /tokens
  def create
    # @token = Token.new(token_params)
    payload = {:data => 'test'}
    rsa_private = OpenSSL::PKey::RSA.generate 2048
    rsa_public = rsa_private.public_key

    token = JWT.encode payload, rsa_private, 'RS256'

    # eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0ZXN0IjoiZGF0YSJ9.c2FynXNyi6_PeKxrDGxfS3OLwQ8lTDbWBWdq7oMviCy2ZfFpzvW2E_odCWJrbLof-eplHCsKzW7MGAntHMALXgclm_Cs9i2Exi6BZHzpr9suYkrhIjwqV1tCgMBCQpdeMwIq6SyKVjgH3L51ivIt0-GDDPDH1Rcut3jRQzp3Q35bg3tcI2iVg7t3Msvl9QrxXAdYNFiS5KXH22aJZ8X_O2HgqVYBXfSB1ygTYUmKTIIyLbntPQ7R22rFko1knGWOgQCoYXwbtpuKRZVFrxX958L2gUWgb4jEQNf3fhOtkBm1mJpj-7BGst00o8g_3P2zHy-3aKgpPo1XlKQGjRrrxA
    puts token

    decoded_token = JWT.decode token, rsa_public, true, { :algorithm => 'RS256' }

    # Array
    # [
    #   {"data"=>"test"}, # payload
    #   {"alg"=>"RS256"} # header
    # ]
    puts decoded_token
    @token = Token.new
    @token.key = token

    if @token.save
      render json: @token, status: :created, location: @token
    else
      render json: @token.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tokens/1
  def update
    if @token.update(token_params)
      render json: @token
    else
      render json: @token.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tokens/1
  def destroy
    @token.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_token
      @token = Token.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def token_params
      params.require(:token).permit(:key)
    end
end
