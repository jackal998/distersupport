class InformationsController < ApplicationController

before_action :authenticate_user!
before_action :find_info, :only => [:show, :update, :destroy]

  def index
    if params[:id]
      @information = Information.find(params[:id])
    else
      @information = Information.new
    end

    @informations = Information.all.page(params[:page]).per(10)
  end

  def show
    @information_comments = @information.information_comments
  end

  def edit
    redirect_to informations_path(:id=>params[:id])
  end

  def update
    @information.update(info_params)
    flash[:notice] = "information update success"
    redirect_to informations_path
  end

  def create
    @information = Information.new(info_params)
    @information.user = current_user
    if @information.save
      flash[:notice] = "information create success"
      redirect_to informations_path
    end
  end

  def destroy
    @information.destroy
    flash[:alert] = "information delete success"
    redirect_to informations_path
  end

  private

  def find_info
    @information = Information.find(params[:id])
  end

  def info_params
    params.require(:information).permit(
      :title,
      :paragraph)
  end
end
