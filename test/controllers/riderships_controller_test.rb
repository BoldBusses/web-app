require 'test_helper'

class RidershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ridership = riderships(:one)
  end

  test "should get index" do
    get riderships_url
    assert_response :success
  end

  test "should get new" do
    get new_ridership_url
    assert_response :success
  end

  test "should create ridership" do
    assert_difference('Ridership.count') do
      post riderships_url, params: { ridership: { pickup_time: @ridership.pickup_time, route_id: @ridership.route_id, student_id: @ridership.student_id } }
    end

    assert_redirected_to ridership_url(Ridership.last)
  end

  test "should show ridership" do
    get ridership_url(@ridership)
    assert_response :success
  end

  test "should get edit" do
    get edit_ridership_url(@ridership)
    assert_response :success
  end

  test "should update ridership" do
    patch ridership_url(@ridership), params: { ridership: { pickup_time: @ridership.pickup_time, route_id: @ridership.route_id, student_id: @ridership.student_id } }
    assert_redirected_to ridership_url(@ridership)
  end

  test "should destroy ridership" do
    assert_difference('Ridership.count', -1) do
      delete ridership_url(@ridership)
    end

    assert_redirected_to riderships_url
  end
end
