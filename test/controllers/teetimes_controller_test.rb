require 'test_helper'

class TeetimesControllerTest < ActionController::TestCase
  setup do
    @teetime = teetimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teetimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teetime" do
    assert_difference('Teetime.count') do
      post :create, teetime: { course_id: @teetime.course_id, event_id: @teetime.event_id, golfer_id: @teetime.golfer_id, teetime: @teetime.teetime, user_id: @teetime.user_id }
    end

    assert_redirected_to teetime_path(assigns(:teetime))
  end

  test "should show teetime" do
    get :show, id: @teetime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teetime
    assert_response :success
  end

  test "should update teetime" do
    patch :update, id: @teetime, teetime: { course_id: @teetime.course_id, event_id: @teetime.event_id, golfer_id: @teetime.golfer_id, teetime: @teetime.teetime, user_id: @teetime.user_id }
    assert_redirected_to teetime_path(assigns(:teetime))
  end

  test "should destroy teetime" do
    assert_difference('Teetime.count', -1) do
      delete :destroy, id: @teetime
    end

    assert_redirected_to teetimes_path
  end
end
