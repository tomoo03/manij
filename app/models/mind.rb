class Mind < ApplicationRecord
  validates :title, presence: true
  belongs_to :goal
end
