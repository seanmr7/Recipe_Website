class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients, array: true
      t.text :description
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
