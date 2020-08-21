class Goal < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :phases, dependent: :destroy
  has_many :minds, dependent: :destroy

  def search_phase(goal)
    phases.find_by(title: goal.phase_title)
  end
end