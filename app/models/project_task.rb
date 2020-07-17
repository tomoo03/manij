class ProjectTask < ApplicationRecord
  validates :title, presence: true
  validates :task_flg, inclusion: [true, false]
  validates :project_phase_id, presence: true
  validates :user_id, presence: true
  belongs_to :project_phase
  belongs_to :user
end
