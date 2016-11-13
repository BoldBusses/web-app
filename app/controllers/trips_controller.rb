class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @route = Route.find(params[:route_id])
    @trips = @route.trips
  end

  def show
  end

  def create
    @trip = Trip.new(
      start_at: Time.current,
      route: Route.find(params[:route_id]),
    )

    if @trip.save
      redirect_to @trip, notice: "Trip was successfully created."
    else
      redirect_to @trip.route, notice: "Unable to create trip"
    end
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: "Trip was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  def complete
    @trip.update(ended_at: Time.current)
    redirect_to @trip, notice: "Trip complete"
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:route_id, :start_at, :ended_at)
  end
end
