class Recipe < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :ingredients, presence: true
	serialize :ingredients
	#before_save :normalize_ingredients

	private

		def normalize_ingredients
			self.ingredients = self.ingredients.split("\r\n")
		end

end
