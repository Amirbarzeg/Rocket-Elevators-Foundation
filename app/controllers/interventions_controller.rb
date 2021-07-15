class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  
  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    employee = Employee.find_by(user_id: current_user.id)
    puts employee.id

    @current_user_id = current_user.id 
      customer = params[:customer]
      column = params[:column]
      elevator = params[:elevator] 
      battery = params[:battery]

    @intervention = Intervention.new({
      author_id: employee.id,
      customer_id: params[:customer],
      building_id: params[:building],
      battery_id: params[:battery],
      column_id: params[:column],
      elevator_id: params[:elevator],
      employee_id: params[:employee],
      start_date: nil,
      end_date: nil,
      result: "Incomplete",
      report: params[:report],
      status: "Pending"  
      
    })
      

    if @intervention.save!
      redirect_back fallback_location: root_path, notice: "Intervention Was Sent"
    end

  end

  def get_buildings
    @buildings = Building.where(customer_id: params[:customer_id])

    respond_to do |format|
      format.json { render :json => @buildings}
    end
  end
  
  def get_batteries
    @batteries = Battery.where(building_id: params[:building_id])

    respond_to do |format|
      format.json { render :json => @batteries}
    end
  end

  def get_columns
    @columns = Column.where(battery_id: params[:battery_id]) 

    respond_to do |format|
      format.json { render :json => @columns}
    end
  end

  def get_elevators
    @elevators = Elevator.where(column_id: params[:column_id] ) 

    respond_to do |format|
      format.json { render :json => @elevators}
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:name, :username)
    end
    
end
