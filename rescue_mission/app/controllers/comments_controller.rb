class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  #
  def show
    @comment = Comment.new(comment_params)
    @comments = Comment.all.where(question_id: @question.id)
  end

  def create
    @comments = Comment.all.where(question_id: @question.id)
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment added.'
    end
  end
end
#
  def index
    @comments = Comment.all.where(question_id: @question.id)
    @comments.order('timestamps asc')
    def destroy
      @comments = Comment.destroy(params[:id])
      flash[:notice] = 'Comment deleted.'
      redirect_to '/questions'
    end
  end
#
#   def edit
#     @question = Question.find(params[:id]).edit
# #   end
# #
  protected

  def comment_params
    params.permit(:comment).permit(:body, :question_id)
  end
