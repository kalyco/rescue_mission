class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def show
    @question = Question.find_by(params[:id])
    @comment = Comment.new
    @comments = Comment.all
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
  end

  def destroy
    unless Question.find(params[:id]) ==  nil
      @question = Question.find(params[:id])
    end
      if current_user != nil
        if current_user.id == @question.user_id
        @questions = Question.destroy(params[:id])
        @comments = Comment.where(question_id: params[:id])
        if @comments.present?
        destroy
        end
        flash[:notice] = 'Question deleted.'
        redirect_to '/questions'
        else
          flash[:notice] = "Can not delete other user questions"
          redirect_to '/questions'
        end
      else
        flash[:notice] = "Must be logged in to delete questions"
        redirect_to '/questions'
      end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if current_user != nil
      if current_user.id == @question.user_id
        if @question.update_attributes(question_params)
        flash[:notice] = 'Question has been updated'
        redirect_to '/questions'
      else
        flash[:notice] = "Can not edit other user questions"
        redirect_to '/questions'
        end
      end
    else
      flash[:notice] = "Must be logged in to edit questions"
      redirect_to '/questions'
      render :edit
    end
  end

  protected

  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
