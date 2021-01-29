require 'test_helper'

class MinningTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minning_type = minning_types(:one)
  end

  test "should get index" do
    get minning_types_url
    assert_response :success
  end

  test "should get new" do
    get new_minning_type_url
    assert_response :success
  end

  test "should create minning_type" do
    assert_difference('MinningType.count') do
      post minning_types_url, params: { minning_type: { acronym: @minning_type.acronym, description: @minning_type.description } }
    end

    assert_redirected_to minning_type_url(MinningType.last)
  end

  test "should show minning_type" do
    get minning_type_url(@minning_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_minning_type_url(@minning_type)
    assert_response :success
  end

  test "should update minning_type" do
    patch minning_type_url(@minning_type), params: { minning_type: { acronym: @minning_type.acronym, description: @minning_type.description } }
    assert_redirected_to minning_type_url(@minning_type)
  end

  test "should destroy minning_type" do
    assert_difference('MinningType.count', -1) do
      delete minning_type_url(@minning_type)
    end

    assert_redirected_to minning_types_url
  end
end
