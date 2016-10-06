require 'test_helper'

class CatRentalRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cat_rental_request_new_url
    assert_response :success
  end

  test "should get create" do
    get cat_rental_request_create_url
    assert_response :success
  end

end
