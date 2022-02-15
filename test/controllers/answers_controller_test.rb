require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
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
  
  test "should edit view" do
    if @question.save
      if @answer.save
        get "http://localhost:3000/ru/questions/#{@question.id}/answers/#{@answer.id}/edit"
        assert_select 'textarea[name="answer[body]"]'
        assert @answer.destroy
      end
    end
  end 

  test "should new answer no empty by setup" do
    post "http://localhost:3000/ru/questions/#{@question.id}/answers/", params:{answer: { body: @answer_second.body}}
    assert_redirected_to "http://localhost:3000/ru"
    assert @answer.save
    if @answer.save
      assert @answer.destroy
    end
  end

  test "should update answer no empty data" do
    assert @answer.save
    if @answer.save
      patch "http://localhost:3000/ru/questions/#{@question.id}/answers/#{@answer.id}/", params:{answer: { body: @answer_second.body}} 
      assert_response :redirect
      assert @answer.update body: @answer_second.body
      assert_redirected_to "http://localhost:3000/ru"
      assert @answer.destroy
    end
  end
end
