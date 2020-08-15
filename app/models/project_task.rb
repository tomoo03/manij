class ProjectTask < ApplicationRecord
  validates :title, presence: true
  validates :task_flg, inclusion: [true, false]
  belongs_to :project_phase
  belongs_to :user
end