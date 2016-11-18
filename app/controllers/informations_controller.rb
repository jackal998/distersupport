class InformationsController < ApplicationController

before_action :authenticate_user!

  def index
    if params[:id]
      @information = Information.find(params[:id])
    else
      @information = Information.new
    end

    @informations = Information.all.page(params[:page]).per(10)
  end

  def show
    @information = Information.find(params[:id])
    @information_comments = @information.information_comments
  end

  def create
    @information = Information.new(info_params)
      if @information.save
        flash[:notice] = "information create success"
        redirect_to informations_path
      else
      end
  end

  private

  def info_params

    params.require(:information).permit(
      :title,
      :paragraph)
    
  end
end
