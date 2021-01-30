class TagsController < ApplicationController

  def index
    
  end

  def user_related_recipes
    @tag = Tag.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipes = Recipe.joins(:taggings).where('recipes.id != ?', @recipe.id).where(taggings: { tag_id: @tag.id })
  end

  def new
    @recipe = Recipe.find(params[:id])
    @tag = Tag.new
  end

  def create
  end

  def destroy
  end
end