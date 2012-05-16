require 'test_helper'

class TaskDoersControllerTest < ActionController::TestCase
  setup do
    @task_doer = task_doers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_doers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_doer" do
    assert_difference('TaskDoer.count') do
      post :create, task_doer: { task_id: @task_doer.task_id, user_id: @task_doer.user_id }
    end

    assert_redirected_to task_doer_path(assigns(:task_doer))
  end

  test "should show task_doer" do
    get :show, id: @task_doer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_doer
    assert_response :success
  end

  test "should update task_doer" do
    put :update, id: @task_doer, task_doer: { task_id: @task_doer.task_id, user_id: @task_doer.user_id }
    assert_redirected_to task_doer_path(assigns(:task_doer))
  end

  test "should destroy task_doer" do
    assert_difference('TaskDoer.count', -1) do
      delete :destroy, id: @task_doer
    end

    assert_redirected_to task_doers_path
  end
end
