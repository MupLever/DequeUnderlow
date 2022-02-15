# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authentication, only: %i[new create update edit destroy]
  before_action :before_recieve, only: %i[show destroy edit update]
  before_action :authorization_user?, only: %i[update edit destroy]
  def index
    @questions = Question.order(created_at: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build recieve_params
    if @question.save
      flash[:success] = 'Our question was successfully created'
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update recieve_params
      redirect_to questions_path
      flash[:success] = 'Our question was successfully updated'
    else
      render :new
    end
  end

  def edit; end

  def destroy
    @question.destroy
    flash[:success] = 'The question was successfully deleted'
    redirect_to questions_path
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order(created_at: :desc).page params[:page]
  end

  private

  def recieve_params
    params.require(:question).permit(:title, :body)
  end

  def before_recieve
    @question = Question.find params[:id]
  end

  def authorization_user?
    return if current_user == @question.user

    flash[:warning] = 'You are not author of this question'
    redirect_to root_path
  end
end
