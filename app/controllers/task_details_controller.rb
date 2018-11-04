class TaskDetailsController < ApplicationController
  def index
  end


  def create
    @task = Task.find(params[:task_id])
    if helpers.checking(@task).nil?
      @task_details = TaskDetail.new(user: current_user, task: @task, completed: true, status:true)
      @task_details.save
      flash[:success] = "Tarea Completada!!!"
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @task_detail = current_user.tasks.find(params[:task_id])
    @task_detail.task_details[0].destroy
    redirect_to root_path, notice: 'La tarea fue eliminada de la lista'
  end

  def show
      @task_detail = Task.find(params[:task_id])
      @task_detail.task_detail[0]
      @completed_tasks = @completed_task.users
      @completed_tasks_ranked = Task.find(params[:task_id])
      @completed_tasks_ranked = @completed_tasks_ranked.completed_tasks.order(:created_at).limit(5)
      @completed_tasks_ranked
  end



end
