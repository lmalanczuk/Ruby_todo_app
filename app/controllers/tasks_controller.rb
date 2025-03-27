class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
  end

  def show
  end

  def new
    @tasks = Tasks.new
  end

  def create
    @tasks = Tasks.new(task_params)
    
    if @tasks.save
      redirect_to @task, notice: "Zadanie zostało utworzone"
    else
      render: :new
    end
  end

  def edit
  end

  def update
    if @tasks.update(task_params)
      redirect_to @task, notice: "Zadanie zostało zaktualizowane"
    else
      render: :edit
    end
  end

  def delete
    @tasks.delete
    redirect_to tasks_url, notice: "Zadanie zostało usunięte"
  end

private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
