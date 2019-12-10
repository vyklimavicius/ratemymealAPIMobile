class Api::V1::UsersController < ApplicationController

  before_action :set_user, only: [ :show, :update, :destroy]

  # GET /users
  def index
    @users = User.all.with_attached_avatar

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.avatar.attach(io: avatar_io, filename: avatar_name)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
    
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :lastname, :password, :email, :avatar)
    end

    def avatar_io
    decoded_image = Base64.decode64(params[:user][:avatar])
     StringIO.new(decoded_image)
    end
  
    def avatar_name
    params[:user][:avatar_name]
    end
end
