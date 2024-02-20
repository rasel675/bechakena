require "test_helper"

class ShopAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_addresses_index_url
    assert_response :success
  end
end
