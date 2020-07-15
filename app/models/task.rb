class Task < ApplicationRecord
  validates :title, presence: true
  validates :task_flg, inclusion: [true, false]
  belongs_to :phase
end
