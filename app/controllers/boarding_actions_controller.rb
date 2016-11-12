class BoardingActionsController < ApplicationController
  before_action :set_boarding_action, only: [:show, :edit, :update, :destroy]

  # GET /boarding_actions
  # GET /boarding_actions.json
  def index
    @boarding_actions = BoardingAction.all
  end

  # GET /boarding_actions/1
  # GET /boarding_actions/1.json
  def show
  end

  # GET /boarding_actions/new
  def new
    @boarding_action = BoardingAction.new
  end

  # GET /boarding_actions/1/edit
  def edit
  end

  # POST /boarding_actions
  # POST /boarding_actions.json
  def create
    @boarding_action = BoardingAction.new(boarding_action_params)

    respond_to do |format|
      if @boarding_action.save
        format.html { redirect_to @boarding_action, notice: 'Boarding action was successfully created.' }
        format.json { render :show, status: :created, location: @boarding_action }
      else
        format.html { render :new }
        format.json { render json: @boarding_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boarding_actions/1
  # PATCH/PUT /boarding_actions/1.json
  def update
    respond_to do |format|
      if @boarding_action.update(boarding_action_params)
        format.html { redirect_to @boarding_action, notice: 'Boarding action was successfully updated.' }
        format.json { render :show, status: :ok, location: @boarding_action }
      else
        format.html { render :edit }
        format.json { render json: @boarding_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boarding_actions/1
  # DELETE /boarding_actions/1.json
  def destroy
    @boarding_action.destroy
    respond_to do |format|
      format.html { redirect_to boarding_actions_url, notice: 'Boarding action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boarding_action
      @boarding_action = BoardingAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boarding_action_params
      params.require(:boarding_action).permit(:trip_id, :student_id, :onboard, :boarded_at)
    end
end
