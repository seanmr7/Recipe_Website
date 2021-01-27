class CreateTagMap < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_maps do |t|
      t.belongs_to :recipe
      t.belongs_to :tag

      t.timestamps
    end
  end
end
