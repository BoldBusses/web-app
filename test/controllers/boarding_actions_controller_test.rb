require 'test_helper'

class BoardingActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boarding_action = boarding_actions(:one)
  end

  test "should get index" do
    get boarding_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_boarding_action_url
    assert_response :success
  end

  test "should create boarding_action" do
    assert_difference('BoardingAction.count') do
      post boarding_actions_url, params: { boarding_action: { boarded_at: @boarding_action.boarded_at, onboard: @boarding_action.onboard, student_id: @boarding_action.student_id, trip_id: @boarding_action.trip_id } }
    end

    assert_redirected_to boarding_action_url(BoardingAction.last)
  end

  test "should show boarding_action" do
    get boarding_action_url(@boarding_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_boarding_action_url(@boarding_action)
    assert_response :success
  end

  test "should update boarding_action" do
    patch boarding_action_url(@boarding_action), params: { boarding_action: { boarded_at: @boarding_action.boarded_at, onboard: @boarding_action.onboard, student_id: @boarding_action.student_id, trip_id: @boarding_action.trip_id } }
    assert_redirected_to boarding_action_url(@boarding_action)
  end

  test "should destroy boarding_action" do
    assert_difference('BoardingAction.count', -1) do
      delete boarding_action_url(@boarding_action)
    end

    assert_redirected_to boarding_actions_url
  end
end
