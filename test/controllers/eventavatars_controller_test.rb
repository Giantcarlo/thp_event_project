require 'test_helper'

class EventavatarsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get eventavatars_create_url
    assert_response :success
  end

end
