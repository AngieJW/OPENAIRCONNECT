class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @events = Event.all
  end

  def dashboard
    # @eventsbooked = Events.join(:booking).where(booking: { user: current_user })
    @myevents = current_user.events
  end
end
