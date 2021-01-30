class TagsController < ApplicationController

  def index
    
  end

  def user_related_recipes
    #@tag = Tag.find(params[:id])
    #@recipes = Recipe.join(:taggings).where('recipes.id != ?', @recipes.id).where(taggings: { tag_id: @article.tag_ids })
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