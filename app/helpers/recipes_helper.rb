module RecipesHelper
  def prep_ingredient_list(ingredients_arr)
    ingredients = ingredients_arr.split("\r\n")
    #ingredients.map do |string|
      #string.gsub(/[^0-9a-z ]/i, '').strip
    #end
  end
end
