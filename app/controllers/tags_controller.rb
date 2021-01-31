class TagsController < ApplicationController

  def index
    
  end

  # GET request to user_related_recipes. Requires user id, tag id, and recipe id.
  # Lists recipes with tag id
  def user_related_recipes
    @tag = Tag.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipes = Recipe.joins(:taggings).where('user_id = ?', params[:user_id])
                                      .where('recipes.id != ? OR recipes.id = ?', @recipe.id, @recipe.id)
                                      .where(taggings: { tag_id: @tag.id })
                                      .includes(:tags)
  end

  def related_recipes
    @recipe = Recipe.find(params[:recipe_id])
    @recipes = Recipe.joins(:taggings).where('recipes.id != ? OR recipes.id = ?', @recipe.id, @recipe.id)
                                      .where(taggings: { tag_id: @tag.id })
                                      .includes(:tags)
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