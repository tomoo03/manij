module ApplicationHelper
  def sort_created_at(tasks)
    tasks.order("created_at ASC")
  end

  def sort_tasks(tasks)
    tasks.where(task_flg: true)
  end
end