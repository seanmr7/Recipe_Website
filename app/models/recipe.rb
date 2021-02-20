class Recipe < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_one_attached :recipe_picture

  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :instructions

  validates :name, presence: true

  def self.filter_by_tag(tag)
    joins(:taggings).where(taggings: { tag_id: tag.id })
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect do |name| 
      Tag.find_or_create_by(tag_name: name)
    end
    self.tags = new_or_found_tags
  end

  def tag_list
    tags.join(", ")
  end
end
