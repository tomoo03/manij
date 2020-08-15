module ApplicationHelper
  def sort_created_at(sort_item)
    sort_item.order("created_at ASC")
  end

  def sort_tasks(tasks)
    tasks.where(task_flg: true)
  end
end