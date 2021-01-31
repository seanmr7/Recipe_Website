class Tag < ApplicationRecord
  has_many :taggings
  has_many :recipes, through: :taggings

  def to_s
    tag_name
  end
end
