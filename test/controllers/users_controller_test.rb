require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should display errors" do
  	user_data = {name: 'Some Name', email: 'email@examplecom', password: 'foobar', password_confirmation: 'foobar' }
  	post :create, user: user_data
  	assert_select 'div#error_explination'
  	assert_select 'div#error_explination' do
  		assert_select 'li', { count: 1 }
  	end
  end

end
