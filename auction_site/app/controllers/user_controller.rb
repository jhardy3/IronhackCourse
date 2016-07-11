class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
    new_user = User.create(params[:user])
    new_user.save

    redirect_to("user/#{new_user.id}")
  end

  def destroy

  end

  def new
  end

end
