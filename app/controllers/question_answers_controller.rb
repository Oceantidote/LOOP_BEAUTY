class QuestionAnswersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_question_answer, only: [:edit, :update, :destroy]

  def show
    @question_answer = QuestionAnswer.find_by(user: User.friendly.find(params[:id]))
    authorize @question_answer
  end

  def new
    @user = User.friendly.find(params[:user_id])
    @question_answer = QuestionAnswer.new
    authorize @question_answer
  end

  def create
    @question_answer = QuestionAnswer.new(question_answer_params)
    @user = User.friendly.find(params[:user_id])
    @question_answer.user = @user
    authorize @question_answer
    if @question_answer.save
      flash[:notice] = 'Q&A Created'
      redirect_to user_question_answer_path(@question_answer.user, @question_answer)
    else
      flash[:error] = 'Item not added due to error'
      @user = @question_answer.user
      render :new
    end
  end

  def edit
    @user = User.friendly.find(params[:user_id])
    @question_answer.user = @user
    authorize @question_answer
  end

  def update
    if @question_answer.update(question_answer_params)
      flash[:notice] = 'Q&A Updated'
      redirect_to user_question_answer_path(@question_answer.user, @question_answer)
    else
      flash[:error] = 'Please review the problems'
      render :edit
    end
  end

  def destroy
    @user = @question_answer.user
    @question_answer.destroy
    redirect_to influencers_path(id: @user.id)
  end

  private

  def set_question_answer
    @question_answer = QuestionAnswer.find(params[:id])
    authorize @question_answer
  end

  def question_answer_params
    params.require(:question_answer).permit(
      :question_one,
      :question_two,
      :question_three,
      :question_four,
      :question_five,
      :question_six,
      :answer_one,
      :answer_two,
      :answer_three,
      :answer_four,
      :answer_five,
      :answer_six,
      :photo_one,
      :photo_two,
      :photo_three)
  end
end
