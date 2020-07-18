class ProjectMind < ApplicationRecord
  validates :title, presence: true
  validates :project_id, presence: true
  belongs_to :project
end
