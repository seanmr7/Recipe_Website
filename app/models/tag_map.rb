class TagMap < ApplicationRecord
  belongs_to :tags
  belongs_to :recipes
end
