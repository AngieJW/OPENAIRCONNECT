class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @events = policy_scope(Event)
  end

  def dashboard
    # @eventsbooked = Events.join(:booking).where(booking: { user: current_user })
    @myevents = current_user.events
  end

  def strava
  end
end
