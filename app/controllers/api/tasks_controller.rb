class Api::TasksController < ApplicationController

  def index
    @task = Task.find(params[:id])
    if @task.task_flg == true
      @task.update(title: @task.title, task_flg: false)
    else
      @task.update(title: @task.title, task_flg: true)
    end
  end
end