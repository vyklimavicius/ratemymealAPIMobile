class Api::V1::AuthoController < ApplicationController
    # include BCrypt

    def login
    user = params[:autho][:email]
    @user = User.find_by(email: user)
    # binding.pry
    if @user 
    password = params[:autho][:password]
    autho = @user.authenticate(password)
      if autho  
      render json: @user, status: :ok
      else 
      render json: {errors: "Email/password not found"}    
      end 
     else 
      render json: {errors: "Email/password doesn't exists"}    
    end
    end
    # token = JWT.encode this_user, password, 'HS256'
    # binding.pry

end 