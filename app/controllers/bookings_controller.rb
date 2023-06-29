class BookingsController < ApplicationController
  before_action :set_event, only: :create
  before_action :set_booking, only: :destroy

  def create
    @booking = Booking.new
    @booking.event = @event
    @booking.user = current_user
    if @booking.save!
      redirect_to event_path(@event), notice: "Vous avez rejoint l'évènement de #{@event.user.first_name}"
    else
      render event_path(@event), status: :unprocessable_entity
    end
  end

  def destroy
    @event = @booking.event
    @booking.destroy
    redirect_to event_path(@event), notice: "Vous vous êtes désinscrit de l'évènement de #{@event.user.first_name}", status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
