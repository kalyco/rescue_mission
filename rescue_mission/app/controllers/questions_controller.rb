class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @comments = Comment.all.where(question_id: @question.id)
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment added.'
      redirect_to '/questions'
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to '/questions'
    else
      render :new
    end
  end

  def index
    @questions = Question.all
    @questions.order('timestamps des')
    def destroy
      @questions = Question.destroy(params[:id])
      flash[:notice] = 'Question deleted.'
      redirect_to '/questions'
    end
  end

  def edit
    @question = Question.find(params[:id]).edit
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end

  def comment_params
    params.permit(:comment).permit(:body, :question_id)
  end
end
