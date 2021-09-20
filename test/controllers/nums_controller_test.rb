require "test_helper"

class NumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @num = nums(:one)
  end

  test "should get index" do
    get nums_url
    assert_response :success
  end

  test "should get new" do
    get new_num_url
    assert_response :success
  end

  test "should create num" do
    assert_difference('Num.count') do
      post nums_url, params: { num: { number: @num.number } }
    end

    assert_redirected_to num_url(Num.last)
  end

  test "should show num" do
    get num_url(@num)
    assert_response :success
  end

  test "should get edit" do
    get edit_num_url(@num)
    assert_response :success
  end

  test "should update num" do
    patch num_url(@num), params: { num: { number: @num.number } }
    assert_redirected_to num_url(@num)
  end

  test "should destroy num" do
    assert_difference('Num.count', -1) do
      delete num_url(@num)
    end

    assert_redirected_to nums_url
  end
end
