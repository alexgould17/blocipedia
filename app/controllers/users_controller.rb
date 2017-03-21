class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # Create a new user by finding the data from the submitted params
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    # Try to save the user to the db, notify upon failure.
    # Create a session for the new user & redirect them to the main page if success
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
