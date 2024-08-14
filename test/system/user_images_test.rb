require "application_system_test_case"

class UserImagesTest < ApplicationSystemTestCase
  setup do
    @user_image = user_images(:one)
  end

  test "visiting the index" do
    visit user_images_url
    assert_selector "h1", text: "User images"
  end

  test "should create user image" do
    visit user_images_url
    click_on "New user image"

    fill_in "Img", with: @user_image.img
    fill_in "User", with: @user_image.user_id
    click_on "Create User image"

    assert_text "User image was successfully created"
    click_on "Back"
  end

  test "should update User image" do
    visit user_image_url(@user_image)
    click_on "Edit this user image", match: :first

    fill_in "Img", with: @user_image.img
    fill_in "User", with: @user_image.user_id
    click_on "Update User image"

    assert_text "User image was successfully updated"
    click_on "Back"
  end

  test "should destroy User image" do
    visit user_image_url(@user_image)
    click_on "Destroy this user image", match: :first

    assert_text "User image was successfully destroyed"
  end
end
