class AnswersController < ApplicationController


  def new
    @answer = Answer.new
  end

  def create
      @answer = Answer.new(answer_params)
      @answer.user_id = current_user.id
      @answer.save
      render nothing: true
  end
  private

  def answer_params
      params.require(:answer).permit(:content, :question_id, :user_id)
    end

  def set_slide
    @question = Question.find(params[:question_id])
  end
end
