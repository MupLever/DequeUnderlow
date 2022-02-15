require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting the root with system test correct data" do
    visit 'http://localhost:3000/ru/'
    assert_selector '#result', text: "Авторизуйтесь, чтобы увидеть ваши вопросы."
    visit 'http://localhost:3000/ru/session/new'
    fill_in "email", with: "example@gmail.com"
    fill_in "password", with: "123456"
    click_on "Войти"
    visit 'http://localhost:3000/ru/'
    click_on "Вопросы"
    click_on 'Открыть в новом окне'
    click_on 'Редактировать'
  end
end
