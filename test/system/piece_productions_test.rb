require "application_system_test_case"

class PieceProductionsTest < ApplicationSystemTestCase
  setup do
    @piece_production = piece_productions(:one)
  end

  test "visiting the index" do
    visit piece_productions_url
    assert_selector "h1", text: "Piece productions"
  end

  test "should create piece production" do
    visit piece_productions_url
    click_on "New piece production"

    fill_in "Dice", with: @piece_production.dice_id
    fill_in "Number of pieces", with: @piece_production.number_of_pieces
    click_on "Create Piece production"

    assert_text "Piece production was successfully created"
    click_on "Back"
  end

  test "should update Piece production" do
    visit piece_production_url(@piece_production)
    click_on "Edit this piece production", match: :first

    fill_in "Dice", with: @piece_production.dice_id
    fill_in "Number of pieces", with: @piece_production.number_of_pieces
    click_on "Update Piece production"

    assert_text "Piece production was successfully updated"
    click_on "Back"
  end

  test "should destroy Piece production" do
    visit piece_production_url(@piece_production)
    click_on "Destroy this piece production", match: :first

    assert_text "Piece production was successfully destroyed"
  end
end
