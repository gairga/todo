class TaskDetailController < ApplicationController


  def create
  @task = Task.find(params[:task_id])
  if helpers.checking(@task).nil?
    @completed_task = TaskDetail.new(user: current_user, task: @task, completed: true)
    @completed_task.save
    redirect_to root_path, notice: 'Se hizo la tarea'
  else
    @completed_task.destroy
    redirect_to root_path, alert: 'No puede volver a hacer la tarea'
  end
end

def destroy
  @completed_task = current_user.tasks.find(params[:task_id])
  @completed_task.completed_tasks[0].destroy
  redirect_to root_path, notice: 'La tarea fue eliminada de la lista'
end

def show
  @completed_task = Task.find(params[:task_id])
  @completed_task.completed_tasks[0]
  @completed_tasks = @completed_task.users
  @completed_tasks_ranked = Task.find(params[:task_id])
  @completed_tasks_ranked = @completed_tasks_ranked.completed_tasks.order(:created_at).limit(5)
  @completed_tasks_ranked
end



end
