class RidershipsController < ApplicationController
  before_action :set_ridership, only: [:show, :edit, :update, :destroy]

  # GET /riderships
  # GET /riderships.json
  def index
    @riderships = Ridership.all
  end

  # GET /riderships/1
  # GET /riderships/1.json
  def show
  end

  # GET /riderships/new
  def new
    @ridership = Ridership.new
  end

  # GET /riderships/1/edit
  def edit
  end

  # POST /riderships
  # POST /riderships.json
  def create
    @ridership = Ridership.new(ridership_params)

    respond_to do |format|
      if @ridership.save
        format.html { redirect_to @ridership, notice: 'Ridership was successfully created.' }
        format.json { render :show, status: :created, location: @ridership }
      else
        format.html { render :new }
        format.json { render json: @ridership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riderships/1
  # PATCH/PUT /riderships/1.json
  def update
    respond_to do |format|
      if @ridership.update(ridership_params)
        format.html { redirect_to @ridership, notice: 'Ridership was successfully updated.' }
        format.json { render :show, status: :ok, location: @ridership }
      else
        format.html { render :edit }
        format.json { render json: @ridership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riderships/1
  # DELETE /riderships/1.json
  def destroy
    @ridership.destroy
    respond_to do |format|
      format.html { redirect_to riderships_url, notice: 'Ridership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ridership
      @ridership = Ridership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ridership_params
      params.require(:ridership).permit(:student_id, :route_id, :pickup_time)
    end
end
