class ProjectComment < ApplicationRecord
  validates :content, presence: true
  validates :project_phase_id, presence:true
  validates :user_id, presence: true
  belongs_to :project_phase
  belongs_to :user
end
