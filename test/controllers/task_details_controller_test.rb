require 'test_helper'

class TaskDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get task_details_index_url
    assert_response :success
  end

end
