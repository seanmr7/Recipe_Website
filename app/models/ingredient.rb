class Ingredient < ApplicationRecord
  belongs_to :recipe, optional: true

  after_create do
    self.destroy if self.ingredient.empty?
  end

end
