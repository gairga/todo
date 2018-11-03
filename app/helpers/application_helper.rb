module ApplicationHelper
  def checking(task)
    TaskDetail.find_by(['user_id = ? and task_id = ?', current_user.id, task.id])
  end
end
