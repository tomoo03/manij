class ProjectPhase < ApplicationRecord
  validates :title, presence: true
  belongs_to :project
  has_many :project_tasks, dependent: :destroy
  has_many :project_comments, dependent: :destroy
end