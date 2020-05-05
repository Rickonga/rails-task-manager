class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    # params is a constant that has information as hash
    @task = Task.find(params[:id])
  end

  # Dysplay the task form
  def new
    # we create an empty object so we can create the form_for
    @task = Task.new
  end

  # We enter to create when the user press "Create"
  def create
    # How does it know that create is connected to new.html.view?
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path
  end

  # Dysplay the task form (with prefilled data)
  def edit
    @task = Task.find(params[:id])
  end

  # We enter to update when the user press "Update"
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  # Strong params (whitelist permitted attributes)
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
