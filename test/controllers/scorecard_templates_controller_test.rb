require 'test_helper'

class ScorecardTemplatesControllerTest < ActionController::TestCase
  setup do
    @scorecard_template = scorecard_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scorecard_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scorecard_template" do
    assert_difference('ScorecardTemplate.count') do
      post :create, scorecard_template: { course_id: @scorecard_template.course_id, handicaps: @scorecard_template.handicaps, holes: @scorecard_template.holes, pars: @scorecard_template.pars, rating: @scorecard_template.rating, slope: @scorecard_template.slope, tee: @scorecard_template.tee, user_id: @scorecard_template.user_id, yards: @scorecard_template.yards }
    end

    assert_redirected_to scorecard_template_path(assigns(:scorecard_template))
  end

  test "should show scorecard_template" do
    get :show, id: @scorecard_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scorecard_template
    assert_response :success
  end

  test "should update scorecard_template" do
    patch :update, id: @scorecard_template, scorecard_template: { course_id: @scorecard_template.course_id, handicaps: @scorecard_template.handicaps, holes: @scorecard_template.holes, pars: @scorecard_template.pars, rating: @scorecard_template.rating, slope: @scorecard_template.slope, tee: @scorecard_template.tee, user_id: @scorecard_template.user_id, yards: @scorecard_template.yards }
    assert_redirected_to scorecard_template_path(assigns(:scorecard_template))
  end

  test "should destroy scorecard_template" do
    assert_difference('ScorecardTemplate.count', -1) do
      delete :destroy, id: @scorecard_template
    end

    assert_redirected_to scorecard_templates_path
  end
end
