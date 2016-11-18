class InformationCommentsController < ApplicationController
  
  def create
    @information_comment = InformationComment.new(information_comment_params)
    @information_comment.information = Information.find(params[:info])
    @information_comment.user = current_user
    if @information_comment.save
      flash[:notice] = "comment updated"
      redirect_to information_path(params[:info])
    end
  end

  def destroy
    @information = Information.find(params[:info])
    @information.information_comments.find(params[:id]).destroy
    flash[:alert] = "comment deleted"
    redirect_to information_path(params[:info])
  end

  private

  def information_comment_params
    params.require(:information_comment).permit(
      :title,
      :paragraph)
  end
end
