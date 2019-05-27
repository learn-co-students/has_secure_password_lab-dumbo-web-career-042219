class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # debugger
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # debugger
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  
end