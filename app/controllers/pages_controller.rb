class PagesController < ApplicationController
  def home
    @recipes = Recipe.order('id DESC').limit(50)
  end

  def about
  end
end