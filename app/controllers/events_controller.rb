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
    @event = Event.new
    @event.user = current_user
    if @event.save!
      redirect_to events_paths
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
end
