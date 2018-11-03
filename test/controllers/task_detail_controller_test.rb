require 'test_helper'

class TaskDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get task_detail_index_url
    assert_response :success
  end

end
