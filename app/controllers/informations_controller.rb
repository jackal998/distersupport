class InformationsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_info, :only => [:show, :update, :destroy]
  before_action :find_own_info , :only => [:update, :destroy]

  def index
    # 本來的方法並沒有驗證是不是使用者自己才能修改文章
    if params[:id]
      @information = Information.find(params[:id])
    else
      @information = Information.new
    end

    @informations = Information.page(params[:page]).per(10)
  end

  def show
    @information_comments = @information.information_comments
  end

  def edit
    redirect_to informations_path(:id => params[:id])
  end

  def update
    if @information.update(info_params)
      flash[:notice] = "information update success"
      redirect_to informations_path
    else
      @informations = Information.page(params[:page]).per(10)
      render :index
    end
  end

  def create
    @information = Information.new(info_params)
    @information.user = current_user
    if @information.save
      flash[:notice] = "information create success"
      redirect_to informations_path
    else
      @informations = Information.page(params[:page]).per(10)
      render :index
    end
  end

  def destroy
    current_user.informations.find(params[:id]).destroy
    flash[:alert] = "information delete success"
    redirect_to informations_path
  end

  private

  def find_info
    @information = Information.find(params[:id])
  end

  def info_params
    params.require(:information).permit(:title, :paragraph, :category)
  end
end
