class PagesController < ApplicationController
  def home
    @recipes = Recipe.order('id DESC').limit(50).includes(:tags, :user)
    if params[:filter_tag].present?
      @tag = Tag.where('tag_name = ?', params[:filter_tag]).first
      @recipes = @recipes.filter_by_tag(@tag).order('id DESC').limit(50)
    end
  end

  def about
  end
end