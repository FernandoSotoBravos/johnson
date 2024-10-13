require "test_helper"

class PieceProductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piece_production = piece_productions(:one)
  end

  test "should get index" do
    get piece_productions_url
    assert_response :success
  end

  test "should get new" do
    get new_piece_production_url
    assert_response :success
  end

  test "should create piece_production" do
    assert_difference("PieceProduction.count") do
      post piece_productions_url, params: { piece_production: { dice_id: @piece_production.dice_id, number_of_pieces: @piece_production.number_of_pieces } }
    end

    assert_redirected_to piece_production_url(PieceProduction.last)
  end

  test "should show piece_production" do
    get piece_production_url(@piece_production)
    assert_response :success
  end

  test "should get edit" do
    get edit_piece_production_url(@piece_production)
    assert_response :success
  end

  test "should update piece_production" do
    patch piece_production_url(@piece_production), params: { piece_production: { dice_id: @piece_production.dice_id, number_of_pieces: @piece_production.number_of_pieces } }
    assert_redirected_to piece_production_url(@piece_production)
  end

  test "should destroy piece_production" do
    assert_difference("PieceProduction.count", -1) do
      delete piece_production_url(@piece_production)
    end

    assert_redirected_to piece_productions_url
  end
end
