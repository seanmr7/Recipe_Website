class Recipe < ApplicationRecord
	belongs_to :user
	validates :name, presence: true

	def ingredients_array
		:ingredients.split(",")
	end

end
