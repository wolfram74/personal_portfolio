class ProjectsController < ApplicationController
  def index
    @daily_pass = Lock.find_by(property: "admin_pass").value
    if params["admin_pass"] != @daily_pass
      render json: Project.all
    else
      @projects = Project.all
      @new_project = Project.new()
    end
  end

  def show
    @daily_pass = Lock.find_by(property: "admin_pass").value
    if params["admin_pass"] != @daily_pass
      redirect_to("/")
    else
      @project = Project.find(params["id"])
    end
  end

  def create
    Project.create(project_params)
    redirect_to("/")
  end

  def update
    Project.find(params["id"]).update_attributes(project_params)
    redirect_to("/")
  end

  def destroy
    Project.find(params["id"]).destroy
    redirect_to("/")
  end

  private

  def project_params
      params.require(:project).permit(:title, :description, :file_name)
  end

end
