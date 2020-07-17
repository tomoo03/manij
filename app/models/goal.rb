class Goal < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :phases, dependent: :destroy
  has_many :minds, dependent: :destroy
end
