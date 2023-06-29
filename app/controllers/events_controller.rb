class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy create_booking delete_booking]

  def index
    @events = policy_scope(Event)
  end

  def show
    @mybookings = Booking.where( :user == current_user)
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
    @mybookings = Booking.where( :user == current_user)
    authorize @events
  end

  def create_booking
    @booking = Booking.new
    @booking.event = @event
    @booking.user = current_user
    if @booking.save!
      redirect_to event_path(@event), notice: "Vous avez rejoint l'évènement de #{@event.user.first_name}"
    else
      render event_path(@event), status: :unprocessable_entity
    end
  end

  def delete_booking
    @mybookings = Booking.where( :user == current_user)
    @booking = @mybookings.joins(:event).where( :event == @event)
    @booking.destroy
    redirect_to event_path(@event), notice: "Vous vous êtes désinscrit de l'évènement de #{@event.user.first_name}", status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:meeting_date, :meeting_time, :meeting_point, :group_size, :location, :difficulty, :swim, :break, :description)
  end
end
