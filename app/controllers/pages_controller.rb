class PagesController < ApplicationController
  def home
    @recipes = Recipe.order('id DESC').limit(50).includes(:tags, :user)
  end

  def about
  end
end