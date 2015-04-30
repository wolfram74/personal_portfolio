class CollaboratorsController < ApplicationController
  def index
    @daily_pass = Lock.find_by(property: "admin_pass").value
    if params["admin_pass"] != @daily_pass
      render json: Collaborator.all
    else
      @collaborators = Collaborator.all
      @new_collaborator = Collaborator.new()
    end
  end
  def show
    @daily_pass = Lock.find_by(property: "admin_pass").value
    if params["admin_pass"] != @daily_pass
      redirect_to("/")
    else
      @collaborator = Collaborator.find(params["id"])
    end
  end

  def create
    Collaborator.create(collab_params)
    redirect_to("/")
  end

  def update
    Collaborator.find(params["id"]).update_attributes(collab_params)
    redirect_to("/")
  end

  def destroy
    Collaborator.find(params["id"]).destroy
    redirect_to("/")
  end

  private

  def collab_params
      params.require(:collaborator).permit(
        :name, 
        :description, 
        :email,
        :url)
  end
end
