class UsersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where("user_id = ?", params[:id]).includes(:tags)
    if params[:filter_tag].present?
      @tag = Tag.where('tag_name = ?', params[:filter_tag]).first
      @recipes = @recipes.filter_by_tag(@tag)
    end
  end
end