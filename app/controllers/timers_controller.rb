class TimersController < ApplicationController
  before_action :authenticate_user!

  def index
    @timers = Timer.all.group_by{ |t| t.created_at.to_date }
  end

  def create
    @timer = @workspace.timers.new(timer_params)
    @timer.started_at = Time.now
    respond_to do |format|
      if @timer.save!
        format.html { redirect_back fallback_location: root_path, notice: 'Timer started!' }
        format.json { render :show, status: :created, location: @timer }
      end
    end
  end

  def update
    @timer.stopped_at = Time.now if params[:commit] == 'Stop'
    respond_to do |format|
      if @timer.update(timer_params)
        format.html { redirect_back fallback_location: root_path, notice: 'Timer stopped!' }
        format.json { render :show, status: :created, location: @timer }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def timer_params
    params.require(:timer).permit(:description, :project_id, :billable, :workspace_id, :started_at, :stopped_at)
  end

end
