require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  # grab user out of fixtures, similar to before each in jest with seed data
  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test "should show user" do
    get api_v1_user_url(@user), as: :json 
    assert_response :success
    # self is <Api::V1::UsersControllerTest:0x00007fbdec229ed8>
    json_response = JSON.parse(self.response.body) 
    assert_equal @user.email, json_response['email']
  end

  test "should show second user" do
    get api_v1_user_url(@user2), as: :json 
    assert_response :success
    json_response = JSON.parse(self.response.body) 
    assert_equal @user2.email, json_response['email']
  end
end
