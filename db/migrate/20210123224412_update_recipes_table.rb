class UpdateRecipesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :ingredients

    add_column :recipes, :ingredients, :string, array: true
    add_column :recipes, :instructions, :string, array:true
    add_column :recipes, :cook_by_date, :datetime
  end
end
