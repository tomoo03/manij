module ApplicationHelper
  def sort_created_at(tasks)
    tasks.order("created_at ASC")
  end
end
