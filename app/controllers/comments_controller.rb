class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      @prototype = Prototype.find(params[:prototype_id])
      @comments = @prototype.comments
      render 'prototypes/show'
    end
  end

  private # これより下が対象
  def comment_params
    # require(袋の名前)   permit(中身)      merge(誰が / どの作品に)
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
