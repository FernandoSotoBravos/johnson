require "application_system_test_case"

class DicesTest < ApplicationSystemTestCase
  setup do
    @dice = dices(:one)
  end

  test "visiting the index" do
    visit dices_url
    assert_selector "h1", text: "Dices"
  end

  test "should create dice" do
    visit dices_url
    click_on "New dice"

    fill_in "Code", with: @dice.code
    fill_in "Max strikes", with: @dice.max_strikes
    click_on "Create Dice"

    assert_text "Dice was successfully created"
    click_on "Back"
  end

  test "should update Dice" do
    visit dice_url(@dice)
    click_on "Edit this dice", match: :first

    fill_in "Code", with: @dice.code
    fill_in "Max strikes", with: @dice.max_strikes
    click_on "Update Dice"

    assert_text "Dice was successfully updated"
    click_on "Back"
  end

  test "should destroy Dice" do
    visit dice_url(@dice)
    click_on "Destroy this dice", match: :first

    assert_text "Dice was successfully destroyed"
  end
end
