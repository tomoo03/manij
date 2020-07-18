class Project < ApplicationRecord
  validates :title, presence: true
  validates :team_id, presence: true
  has_many :project_phases, dependent: :destroy
  has_many :project_minds, dependent: :destroy
  belongs_to :team
  # has_many :phases, dependent: :destroy
  # has_many :minds, dependent: :destroy
end