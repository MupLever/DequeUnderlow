# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authentication, only: %i[create update edit destroy]
  before_action :recieve_question
  before_action :recieve_answers, except: :create
  before_action :authorization_user, only: %i[update edit destroy]
  def create
    @answer = @question.answers.build answers_create_params
    if @answer.save
      redirect_to question_path(@question)
      flash[:success] = 'The response was successfully created'
    else
      render 'question/show'
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = 'The response was successfully deleted'
    redirect_to question_path(@question)
  end

  def edit; end

  def update
    if @answer.update answers_update_params
      redirect_to question_path(@question, anchor: "answer-#{@answer.id}")
      flash[:success] = 'The response was successfully updated'
    else
      render :edit
    end
  end

  private

  def recieve_question
    @question = Question.find params[:question_id]
  end

  def recieve_answers
    @answer = @question.answers.find params[:id]
  end

  def answers_create_params
    params.require(:answer).permit(:body).merge(user_id: current_user.id)
  end

  def answers_update_params
    params.require(:answer).permit(:body)
  end

  def authorization_user
    return if current_user == @answer.user

    flash[:warning] = 'You are not author of this answer'
    redirect_to root_path
  end
end
