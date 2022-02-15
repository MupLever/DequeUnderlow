require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
    @question_second = questions(:two)
    @user = users(:one)
    @question_second.user = @user
    @question.user = @user
  end

  test "should get new view" do
    get "http://localhost:3000/ru/questions/new"
    assert_response :redirect
  end 

  test "should edit view" do
    if @question.save
      get "http://localhost:3000/ru/questions/#{@question.id}/edit"
      assert_response :redirect
      assert @question.destroy
    end
  end 

  test "should update question no empty data" do
    assert @question.save
    if @question.save
      patch "http://localhost:3000/ru/questions/#{@question.id}/", params:{ question: {title: @question_second.title, body: @question_second.body}}
      assert_response :redirect
      assert @question.update title: @question_second.title, body: @question_second.body
      assert_redirected_to "http://localhost:3000/ru"
      assert @question.destroy
    end
  end
end