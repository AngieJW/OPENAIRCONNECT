class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @events = policy_scope(Event.where('location LIKE ?', "%#{params[:query]}%").where.not(user: current_user).order(:meeting_date))
    else
      @events = policy_scope(Event.all.where.not(user: current_user).order(:meeting_date))
    end
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
    # @hike = Hike.create_from_strava(params[:hike_id_strava])
    @event = Event.new(event_params)
    @event.hike = @hike
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
    @myevents = Event.where(user: current_user).order(:meeting_date)
    @mybookings = Booking.joins(:event).where(user: current_user).order(:meeting_date)
    authorize @myevents
  end



  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:meeting_date, :meeting_time, :meeting_point, :group_size, :location, :difficulty, :swim, :break, :description)
  end
end
