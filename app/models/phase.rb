class Phase < ApplicationRecord
  validates :title, presence: true
  validates :goal_id, presence: true
  belongs_to :goal
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
