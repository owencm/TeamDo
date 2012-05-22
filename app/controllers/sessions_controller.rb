class SessionsController < ApplicationController

  def name
    "sessions"
  end

  def create
    @user = User.find(params[:id])
    session[:user] = @user

    respond_to do |format|
      format.html { redirect_to @user, notice: 'Welcome, '+@user.first+"." }
      format.json { head :no_content }
    end
  end
  
  def new
    @users = User.all
    respond_to do |format|
      format.html # new.erb.html
      format.json { render json: @users }
    end
  end
  
end
