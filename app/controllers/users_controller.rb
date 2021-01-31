class UsersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @users = Users.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where("user_id = ?", params[:id]).includes(:tags)
    
  end
end