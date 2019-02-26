require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Sample",
                     last_name: "Test",
                     email: "sample@gbox.adnu.edu.ph",
                     officer: true,
                     password: "password",
                     password_confirmation: "password")
  end

  test "user is valid" do
    assert @user.valid?
  end

  test "first name should be present" do
    @user.first_name = "   "
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "length of first name should be maximum of 15" do
    @user.first_name = "a" * 16
    assert_not @user.valid?
  end

  test "length of last name should be maximum of 15" do
    @user.last_name = "a" * 16
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 254
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[sample@gbox.adnu.edu.ph 1@gbox.adnu.edu.ph]

    valid_addresses.each do |email|
      @user.email = email
      assert @user.save
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[invalid@email.com invalid@yahoo.com]
  
    invalid_addresses.each do |invalid|
      @user.email = invalid
      assert_not @user.save
    end
  end

  test "email should be unique" do
    @duplicate = @user.dup
    @dup_email = @user.email.upcase
    @user.save
    assert_not @duplicate.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation =  "   "
    assert_not @user.valid?
  end

  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
