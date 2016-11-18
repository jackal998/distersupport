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

  private

  def information_comment_params
    params.require(:information_comment).permit(
      :title,
      :paragraph)
  end
end
