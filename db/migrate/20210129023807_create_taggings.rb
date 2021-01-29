class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.belongs_to :recipe
      t.belongs_to :tag

      t.timestamps
    end

    drop_table :tag_maps
  end
end
