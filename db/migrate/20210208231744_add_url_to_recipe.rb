class AddUrlToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :url, :text

  end
end
