class UpdateRecipesTableColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :ingredients
    remove_column :recipes, :instructions

    add_column :recipes, :ingredients, :string
    add_column :recipes, :instructions, :string
  end
end
