require 'test_helper'

module Pawi
  class PagesControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end
  
  end
end
