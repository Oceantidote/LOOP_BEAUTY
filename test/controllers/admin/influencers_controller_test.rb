require 'test_helper'

class Admin::InfluencersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_influencers_new_url
    assert_response :success
  end

end
