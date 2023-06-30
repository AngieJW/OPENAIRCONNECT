class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event)
  end

  def show
    @booking = Booking.find_by(user: current_user, event: @event)
    @mybookings = Booking.where(user: current_user)
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.hike = Hike.new
    authorize @event
    if @event.save!
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @event
  end

  def update
    authorize @event
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  def myevents
    @events = Event.where(user: current_user)
    @mybookings = Booking.where(user: current_user)
    authorize @events
  end



  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:meeting_date, :meeting_time, :meeting_point, :group_size, :location, :difficulty, :swim, :break, :description)
  end
end
