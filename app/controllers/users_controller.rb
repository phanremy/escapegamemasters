class UsersController < ApplicationController

  autocomplete :users, :full_name, full: true

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
