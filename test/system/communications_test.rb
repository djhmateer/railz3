require "application_system_test_case"

class CommunicationsTest < ApplicationSystemTestCase
  setup do
    @communication = communications(:one)
  end

  test "visiting the index" do
    visit communications_url
    assert_selector "h1", text: "Communications"
  end

  test "should create communication" do
    visit communications_url
    click_on "New communication"

    fill_in "Name", with: @communication.name
    click_on "Create Communication"

    assert_text "Communication was successfully created"
    click_on "Back"
  end

  test "should update Communication" do
    visit communication_url(@communication)
    click_on "Edit this communication", match: :first

    fill_in "Name", with: @communication.name
    click_on "Update Communication"

    assert_text "Communication was successfully updated"
    click_on "Back"
  end

  test "should destroy Communication" do
    visit communication_url(@communication)
    click_on "Destroy this communication", match: :first

    assert_text "Communication was successfully destroyed"
  end
end
