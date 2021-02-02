class PagesController < ApplicationController
  def home
    @recipes = Recipe.order('id DESC').limit(50).includes(:tags, :user)
    if params[:filter_tag]
      @tag = Tag.where('tag_name = ?', params[:filter_tag]).first
      @recipes = Recipe.joins(:taggings).where(taggings: { tag_id: @tag.id }).order('id DESC').limit(50)
    end
  end

  def about
  end
end