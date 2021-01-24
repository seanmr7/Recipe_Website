class Recipe < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :ingredients, presence: true
	validates :instructions, presence: true
	serialize :ingredients
	serialize :instructions
	before_save :normalize_ingredients

	private

		def normalize_ingredients
			self.ingredients = self.ingredients.split("\r\n")
		end

end
