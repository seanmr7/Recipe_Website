class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :instructions
    create_table :instructions do |t|
      t.text :body
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
