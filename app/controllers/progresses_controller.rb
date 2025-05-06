class ProgressesController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @progresses = current_user.progresses.order(recorded_on: :asc)
    end
  
    def new
      @progress = Progress.new
    end
  
    def create
      @progress = current_user.progresses.build(progress_params)
      if @progress.save
        redirect_to progresses_path, notice: 'Progreso registrado con éxito.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def progress_params
      params.require(:progress).permit(:recorded_on, :weight, :waist, :hips, :chest, :photo_url)
    end
  end