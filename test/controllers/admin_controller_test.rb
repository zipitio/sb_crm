require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get clients" do
    get admin_clients_url
    assert_response :success
  end

  test "should get users" do
    get admin_users_url
    assert_response :success
  end
end
