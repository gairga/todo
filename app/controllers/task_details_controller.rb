class TaskDetailsController < ApplicationController
  def index
  end


  def create
    @task = Task.find(params[:task_id])
    if helpers.checking(@task).nil?
      @task_details = TaskDetail.new(user: current_user, task: @task, completed: true, status:true)
      @task_details.save
      flash[:success] = "Tarea Completada!!!"
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @task_detail = current_user.tasks.find(params[:task_id])
    @task_detail.task_details[0].destroy
    flash[:success] = "Tarea Eliminada!!!"
    redirect_to tasks_path
  end

  def topfive
    @task_detail = TaskDetail.limit(5)
  end



end
