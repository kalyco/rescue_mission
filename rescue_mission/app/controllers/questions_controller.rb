class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @questions = Question.all
    @questions.order('timestamps des')
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: @question.id)
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to @question
    else
      flash[:alert] = "Question not added!"
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    if current_user.present? && current_user.id == @question.user_id
        if @question.update(question_params)
        flash[:notice] = 'Question has been updated'
        redirect_to question_path(@question)
        end
    else
      flash[:notice] = "Can not edit other user questions"
      redirect_to question_path(@question)
    end
  end

  def destroy
    if Question.find(params[:id])
      @question = Question.find(params[:id])
      @answers = Answer.where(question_id: params[:id])
    end
      if current_user.present? && current_user.id == @question.user_id
        @questions = Question.destroy(params[:id])
        if @answers.present?
        destroy
        end
        flash[:notice] = 'Question deleted.'
        else
          flash[:notice] = "Can not delete other user questions"
      end
        redirect_to action: "index"
  end


  protected

  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
