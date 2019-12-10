class Api::V1::UserController < ApplicationController

    def index
        users = User.all 
        render json: users
    end

    def create
        user = User.new(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            password: params[:password]
            # password_confirmation: params[:password_confirmation]
        )

        if user.save
            session[:user_id] = user.id 
            render json: user
        else
            render json: "Invalid email or password"
        end
    end
end