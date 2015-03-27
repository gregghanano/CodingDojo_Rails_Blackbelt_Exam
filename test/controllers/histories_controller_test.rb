require 'test_helper'

class HistoriesControllerTest < ActionController::TestCase
  test "should get transact" do
    get :transact
    assert_response :success
  end

end
