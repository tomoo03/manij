class Api::TasksController < ApplicationController

  def index
    @task = Task.find(params[:id])
    if @task.task_flg == true
      @task.update_attributes(title: @task.title, task_flg: false)
    else
      @task.update_attributes(title: @task.title, task_flg: true)
    end
  end
end