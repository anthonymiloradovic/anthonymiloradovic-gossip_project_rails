class UsersController < ApplicationController
    def new;end
  
    def show
      @user_db = User.find_by(id: params[:id])
    end
  
    def create
      @user = User.new(
        first_name: params[:first_name],
        last_name: params[: last_name],
        description: params[:description],
        email: params[:eamil],
        age: params[:age],
        password: params[:password],
        password_confirmation: params[:confirm_password],
        city_id: rand[1..20]
        )
      if @user.save
        redirect_to 'index_path'
      else
        render new_user_path
      end
  
    def 
  
  end