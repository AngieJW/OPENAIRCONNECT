class HikeController < ApplicationController
  def initialize
    @client = Strava::Api::Client.new(
      access_token: "babe5ad0a52c3f9817a944bcf24695e2a0a26778")
  end
  def index

  end
end
