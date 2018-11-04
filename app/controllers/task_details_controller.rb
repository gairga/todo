class TaskDetailsController < ApplicationController
  def index
  end

  def create
  @task = Task.find(params[:task_id])
  if helpers.checking(@task).nil?
    @task_details = TaskDetail.new(user: current_user, task: @task, completed: true, status:true)
    @task_details.save
    redirect_to root_path, notice: 'Se hizo la tarea'
  else
    @task_details.destroy
    redirect_to root_path, alert: 'No puede volver a hacer la tarea'
  end
end



end
