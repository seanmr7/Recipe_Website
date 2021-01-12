class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true
end