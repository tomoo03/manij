class Phase < ApplicationRecord
  validates :title, presence: true
  belongs_to :goal
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

  def search_checked_tasks(phase)
    tasks.where(task_flg: true) if tasks.present?
  end

  def search_unchecked_tasks(phase)
    tasks.where(task_flg: false) if tasks.present?
  end
end
