class Instruction < ApplicationRecord
  belongs_to :recipes

  after_create do
    self.destroy if self.body.empty?
  end
end
