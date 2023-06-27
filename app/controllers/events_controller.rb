class EventsController < ApplicationController
  before_action :set_event, only: %i[show]
  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new
    @event.user = current_user
    if @event.save!
      redirect_to events_paths
    else
      render :new, status: :unprocessable_entity
    end
    authorize @event
  end

  def edit
    authorize @event
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
