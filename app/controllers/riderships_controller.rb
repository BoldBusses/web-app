class RidershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ridership, only: [:show, :edit, :update, :destroy]

  def new
    @route = Route.find(params[:route_id])
    @students = Student.all - @route.riderships.map { |s| s.student }
    @ridership = Ridership.new
  end

  def edit
  end

  def create
    @route = Route.find(params[:route_id])
    @students = Student.all - @route.riderships.map { |s| s.student }
    @ridership = @route.riderships.new(ridership_params)
    if params[:pickup_meridian] == "PM"
      params[:pickup_hour] = params[:pickup_hour].to_i + 12
    end
    @ridership.pickup_time = Time.new(0, 1, 1, params[:pickup_hour].to_i, params[:pickup_minute].to_i)

    binding.pry

    if @ridership.save
      redirect_to @ridership.route, notice: 'Ridership was successfully created.'
    else
      render :new
    end
  end

  def update
    if params[:pickup_meridian] == "PM"
      params[:pickup_hour] = params[:pickup_hour].to_i + 12
    end
    @ridership.pickup_time = Time.new(0, 1, 1, params[:pickup_hour].to_i, params[:pickup_minute].to_i)

    if @ridership.save
      redirect_to @ridership.route, notice: 'Ridership was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ridership.destroy
    redirect_to @ridership.route, notice: 'Ridership was successfully destroyed.'
  end

  private

  def set_ridership
    @ridership = Ridership.find(params[:id])
  end

  def ridership_params
    params.require(:ridership).permit(:student_id)
  end
end
