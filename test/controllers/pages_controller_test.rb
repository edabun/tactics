require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "TACTICS"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "TACTICS"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get officer" do
    get officer_path
    assert_response :success
    assert_select "title", "Officers | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
