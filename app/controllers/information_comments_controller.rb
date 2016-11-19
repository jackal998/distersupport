class InformationCommentsController < ApplicationController
  
  def create
    @information_comment = InformationComment.new(information_comment_params)
    @information_comment.information = Information.find(params[:info])
    @information_comment.user = current_user
    # 沒有對於失敗作處理
    if @information_comment.save
      flash[:notice] = "comment updated"
      redirect_to information_path(params[:info])
    else
      @informations = Information.page(params[:page]).per(10)
      render "informations/index"
    end
  end

  def destroy
    @information = Information.find(params[:info])
    @comment = @information.information_comments.find(params[:id])
    if @comment.user == current_use
      @comment.destroy
      flash[:alert] = "comment deleted"
    else
      flash[:alert] = "你不能刪除他人的留言"
    end
    redirect_to information_path(params[:info])
  end

  private

  def information_comment_params
    # 很短沒必要斷行
    params.require(:information_comment).permit(:title, :paragraph)
  end
end
