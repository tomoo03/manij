class Phase < ApplicationRecord
  validates :title, presence: true
  belongs_to :goal
  has_many :tasks
  has_many :comments
end
