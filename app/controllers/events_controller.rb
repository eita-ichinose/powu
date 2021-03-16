class EventsController < ApplicationController

  def index
    @departments = Department.all
    @department = Department.find(params[:department_id])
    @events = Department.find(params[:department_id]).events
    @comment = Comment.new
  end

  def new
    @events = current_user.events
    @department = Department.find(params[:department_id])
  end

  def create
    @department = Department.find(params[:department_id])
    @events = @department.events.new(event_params)
    if @events.save
      redirect_to department_events_path(@department.id)
    else
      redirect_to new_department_event_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id, department_id: params[:department_id])
  end

end
