class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @events = Event.all
  end

  def dashboard
    @myevents = current_user.events
    @mybookings = Booking.where( :user == current_user)
  end

  def strava
  end
end
