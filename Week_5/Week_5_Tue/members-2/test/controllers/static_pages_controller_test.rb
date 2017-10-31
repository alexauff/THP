require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get static_pages_new_path
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
