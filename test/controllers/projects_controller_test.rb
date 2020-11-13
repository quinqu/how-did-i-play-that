require "test_helper"

describe ProjectsController do
  let(:project) { projects(:one) }

  it "should get index" do
    get projects_url
    must_respond_with :success
  end

  it "should get new" do
    get new_project_url
    must_respond_with :success
  end

  it "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: { project: { name: @project.name, user_id: @project.user_id } }
    end

    must_redirect_to project_url(Project.last)
  end

  it "should show project" do
    get project_url(@project)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_project_url(@project)
    must_respond_with :success
  end

  it "should update project" do
    patch project_url(@project), params: { project: { name: @project.name, user_id: @project.user_id } }
    must_redirect_to project_url(project)
  end

  it "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    must_redirect_to projects_url
  end
end
