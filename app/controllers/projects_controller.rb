class ProjectsController < ApplicationController
  def index
    if params["admin_pass"] != Lock.find_by(property: "admin_pass").value
      render json: Project.all
    else
      @projects = Project.all
    end
  end

  def show
    if params["admin_pass"] != Lock.find_by(property: "admin_pass").value
      redirect_to("/")
    else
      @project = Project.find(params["id"])
    end

  end
end
