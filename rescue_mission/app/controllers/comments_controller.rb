class CommentsController < ApplicationController

  def index
    @question = Question.find_by(id: params[:question_id] )
    @comments = Comment.all.where(question_id: params[:question_id])
    @comments.order('timestamps des')
    @comment = Comment.new
  end

  def create
    @question = Question.find_by(id: params[:question_id] )
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment added.'
      redirect_to "/questions/#{@question.id}/comments"
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @question = @comment.question
  end

  protected

  def comment_params
    params.require(:comment).permit(:body, :question_id)
  end
end
