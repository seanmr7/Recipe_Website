class TagsController < ApplicationController

  def index
    
  end

  # GET request to related_recipes
  # Lists all recipes with tag id
  def related_recipes
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    @recipes = Recipe.joins(:taggings).where('recipes.id != ? OR recipes.id = ?', @recipe.id, @recipe.id)
                                      .where(taggings: { tag_id: params[:id] })
                                      .includes(:tags)
    if params[:user_id]
      @user_recipes = Recipe.joins(:taggings).where('user_id = ?', params[:user_id])
                                              .where('recipes.id != ? OR recipes.id = ?', @recipe.id, @recipe.id)
                                              .where(taggings: { tag_id: params[:id] })
                                              .includes(:tags)
    end
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