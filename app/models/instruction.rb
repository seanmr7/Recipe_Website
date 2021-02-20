class Instruction < ApplicationRecord
  belongs_to :recipe

  after_create do
    self.destroy if self.body.empty?
  end
end
