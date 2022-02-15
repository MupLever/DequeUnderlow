require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "should session" do
    visit 'http://localhost:3000/ru/session/new'
    fill_in "email", with: "example@gmail.com"
    fill_in "password", with: "123456"
    click_on "Войти"
    visit 'http://localhost:3000/ru/'
    click_on "Вопросы"
    click_on 'Открыть в новом окне'
    click_on 'Редактировать'
    assert_selector '#result', text: 'End'
  end
end
