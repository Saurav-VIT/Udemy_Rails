# require "test_helper"

# class WelcomeControllerTest < ActionDispatch::IntegrationTest
#   test "should get index" do
#     get welcome_index_url
#     assert_response :success
#   end
# end

require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end
end
