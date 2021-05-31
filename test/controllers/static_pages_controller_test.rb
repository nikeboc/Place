require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # テスト実行前に実行されるメソッド
  def setup
    @base_title = "Place"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get coporate" do
    get coporate_path
    assert_response :success
    assert_select "title", "Coporate | #{@base_title}"
  end
end
