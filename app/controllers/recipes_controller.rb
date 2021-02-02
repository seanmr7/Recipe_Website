class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :edit, :update, :destroy]
before_action :only_current_user, only: [:new, :create, :edit, :update, :destroy]
# GET /recipes
# GET /recipes.json
def index
  @recipes = Recipe.all.includes(:tags, :user)
  if params[:filter_tag]
    @tag = Tag.where('tag_name = ?', params[:filter_tag]).first
    @recipes = Recipe.joins(:taggings).where(taggings: { tag_id: @tag.id })
  end
end

def user_recipes
  @user = User.find(params[:user_id])
  @recipes = @user.recipes.includes(:tags)
  if params[:filter_tag]
    @tag = Tag.where('tag_name = ?', params[:filter_tag]).first
    @recipes = Recipe.joins(:taggings).where(taggings: { tag_id: @tag.id })
  end
end

# GET /recipes/1
# GET /recipes/1.json
def show
end

# GET /recipes/new
def new
  @user = User.find(params[:user_id])
  @recipe = Recipe.new
end

# GET /recipes/1/edit
def edit
  @user = User.find(params[:user_id])
end

# POST /recipes
# POST /recipes.json
def create
  @user = User.find(params[:user_id])
  @recipe = @user.recipes.build(recipe_params)

  respond_to do |format|
    if @recipe.save
      format.html { redirect_to user_recipe_path(user_id: current_user.id, id: @recipe.id), notice: 'Recipe added!' }
      format.json { render :show, status: :created, location: @recipe }
    else
      format.html { render :new }
      format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /recipes/1
# PATCH/PUT /recipes/1.json
def update
  respond_to do |format|
    if @recipe.update(recipe_params)
      format.html { redirect_to user_recipe_path(user_id: current_user.id, id: @recipe.id), notice: 'Recipe was successfully updated.' }
      format.json { render :show, status: :ok, location: @recipe }
    else
      format.html { render :edit }
      format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /recipes/1
# DELETE /recipes/1.json
def destroy
  @recipe.destroy
  respond_to do |format|
    format.html { redirect_to user_path(id: current_user.id), notice: 'Recipe was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(
      :name, 
      :description, 
      :rating, 
      :user_id, 
      :cook_by_date,
      :tag_list,
      :ingredients, 
      :instructions
    )
  end

  # Only allow logged in user to create, update, and destroy recipes
  def only_current_user
    @user = User.find(params[:user_id])
    if @user.profile && !(@user == current_user)
      redirect_to(root_path)
    end
  end

end
