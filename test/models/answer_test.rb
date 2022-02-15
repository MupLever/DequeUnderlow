require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  setup do
    str = (0...60).map do
      ('a'..'z').to_a[rand(26)]
    end.join
    @question = questions(:one)
    @user= users(:one)
    @answer_second = answers(:two)
    @answer = @question.answers.build body: str
    @answer.user = @user
  end
  
  test "should new answer empty by setup" do
    str = (0...10).map do
      ('a'..'z').to_a[rand(26)]
    end.join
    answer = @question.answers.build body: str
    assert !answer.save
  end
end
