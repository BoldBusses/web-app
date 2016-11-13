class BoardingActionsController < ApplicationController
  before_action :set_boarding_action, only: [:show, :edit, :update, :destroy]

  def create
    @boarding_action = BoardingAction.new(boarding_action_params)
    @boarding_action.trip = Trip.find(params[:trip_id])
    @boarding_action.boarded_at = Time.current

    if @boarding_action.save
      redirect_to @boarding_action.trip, notice: "Boarding action was successfully created."
    else
      redirect_to Trip.find(params[:trip_id]), alert: "Unable to create boarding action"
    end
  end

  def update
    if @boarding_action.update(boarding_action_params)
      redirect_to @boarding_action.trip, notice: "Boarding action was successfully updated."
    else
      redirect_to @boarding_action.trip, alert: "Unable to update boarding action"
    end
  end

  private

  def set_boarding_action
    @boarding_action = BoardingAction.find(params[:id])
  end

  def boarding_action_params
    params.require(:boarding_action).permit(:student_id, :onboard)
  end
end
