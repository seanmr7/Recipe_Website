class Tag < ApplicationRecord
  has_many :tagmaps
  has_many :recipes, through: :tagmaps
end
