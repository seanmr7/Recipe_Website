class Recipe < ApplicationRecord
  belongs_to :user
  has_many :tag_maps
  has_many :tags, through: :tag_maps
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  #before_save :normalize_ingredients, :normalize_instructions
  serialize :ingredients
  serialize :instructions

  private

    def normalize_ingredients
      self.ingredients = self.ingredients.split("\r\n").split("\\").each { |string| string.strip }
    end

    def normalize_instructions
      self.instructions = self.instructions.split("\r\n").each { |string| string.strip }
    end

    def tag_list = (tags_string)
      tag_names = tags_string.split(",").collect { |string| s.strip.downcase }.uniq
      new_and_found_tags = tag_names.collect { |tag_name| Tag.find_or_create_by(tag_name: tag_name) }
      self.tags = new_and_found_tags
    end

    def tag_list
      tags.join(",")
    end
end
