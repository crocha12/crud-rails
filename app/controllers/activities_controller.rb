class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities
  def index
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    @activities = Activity.where(date: date).order(:start_time)
  end

  # GET /activities/1
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)
    return redirect_to activity_url(@activity), notice: "Activity was successfully created." if @activity.save 
    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    return redirect_to activity_url(@activity), notice: "Activity was successfully updated." if @activity.update(activity_params)
    render :edit, status: :unprocessable_entity 
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy
    redirect_to activities_url, notice: "Activity was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.fetch(:activity).permit(:title, :description, :start_time, :end_time, :date)
    end
end
