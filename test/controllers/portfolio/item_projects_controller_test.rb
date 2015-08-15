require 'test_helper'

module Portfolio
  class ItemProjectsControllerTest < ActionController::TestCase
    setup do
      @item_project = portfolio_item_projects(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:item_projects)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create item_project" do
      assert_difference('ItemProject.count') do
        post :create, item_project: { description: @item_project.description, item_id: @item_project.item_id, name: @item_project.name, url: @item_project.url }
      end

      assert_redirected_to item_project_path(assigns(:item_project))
    end

    test "should show item_project" do
      get :show, id: @item_project
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @item_project
      assert_response :success
    end

    test "should update item_project" do
      patch :update, id: @item_project, item_project: { description: @item_project.description, item_id: @item_project.item_id, name: @item_project.name, url: @item_project.url }
      assert_redirected_to item_project_path(assigns(:item_project))
    end

    test "should destroy item_project" do
      assert_difference('ItemProject.count', -1) do
        delete :destroy, id: @item_project
      end

      assert_redirected_to item_projects_path
    end
  end
end
