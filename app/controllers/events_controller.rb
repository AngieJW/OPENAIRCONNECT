class EventsController < ApplicationController
  before_action :set_event, only: %i[show]
  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.hike = Hike.new
    if @event.save!
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:meeting_date, :meeting_time, :meeting_point, :group_size)
  end
end
