class ProjectsController < ApplicationController
  def index
    puts "hit route"
    render json: Project.all
  end
end
