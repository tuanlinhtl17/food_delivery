class CommentsController < ApplicationController
  def create
    if !params[:comment][:content].present? && params[:pictures].nil?
      redirect_to(request.referrer)
    else
      @comment = current_user.comments.new comment_params
      if @comment.save
        if params[:pictures]
          params[:pictures][:image].each do |i|
            @comment.pictures.create(:image => i)
          end
          redirect_to request.referrer
        else
          redirect_to request.referrer
        end
      end
    end
    end
  private
  def comment_params
    params.require(:comment).permit(:content,:food_id, pictures_attributes: [:id, :image, :comment_id])
  end
end
