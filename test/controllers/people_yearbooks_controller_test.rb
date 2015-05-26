require 'test_helper'

class PeopleYearbooksControllerTest < ActionController::TestCase
  setup do
    @people_yearbook = people_yearbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_yearbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create people_yearbook" do
    assert_difference('PeopleYearbook.count') do
      post :create, people_yearbook: {  }
    end

    assert_redirected_to people_yearbook_path(assigns(:people_yearbook))
  end

  test "should show people_yearbook" do
    get :show, id: @people_yearbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @people_yearbook
    assert_response :success
  end

  test "should update people_yearbook" do
    patch :update, id: @people_yearbook, people_yearbook: {  }
    assert_redirected_to people_yearbook_path(assigns(:people_yearbook))
  end

  test "should destroy people_yearbook" do
    assert_difference('PeopleYearbook.count', -1) do
      delete :destroy, id: @people_yearbook
    end

    assert_redirected_to people_yearbooks_path
  end
end
