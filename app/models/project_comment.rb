class ProjectComment < ApplicationRecord
  validates :content, presence: true
  belongs_to :project_phase
  belongs_to :user
end
