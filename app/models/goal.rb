class Goal < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :phases
  has_many :minds
end
