require "test_helper"

class AlcoholGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get alcohol_genres_index_url
    assert_response :success
  end

  test "should get show" do
    get alcohol_genres_show_url
    assert_response :success
  end

  test "should get edit" do
    get alcohol_genres_edit_url
    assert_response :success
  end
end
