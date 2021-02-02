class Recipe < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  #before_save :normalize_ingredients, :normalize_instructions
  serialize :ingredients
  serialize :instructions

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

  private

    def normalize_ingredients
      self.ingredients = self.ingredients.split("\r\n").split("\\").each { |string| string.strip }
    end

    def normalize_instructions
      self.instructions = self.instructions.split("\r\n").each { |string| string.strip }
    end


end
