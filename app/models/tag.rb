class Tag < ApplicationRecord
  has_many :tag_maps
  has_many :recipes, through: :tag_maps

  def to_s
    tag_name
  end
end
