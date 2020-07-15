class Api::TasksController < ApplicationController

  def index
    @task = Task.find(params[:id])
    phase = @task.phase
    goal = phase.goal
    if @task.task_flg == true
      @task.update_attributes(title: @task.title, task_flg: false)
    else
      @task.update_attributes(title: @task.title, task_flg: true)
      unless goal.phase_title == phase.title
        goal.update_attributes(title: goal.title, phase_title: phase.title)
      end
    end
  end
end