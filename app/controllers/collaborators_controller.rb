class CollaboratorsController < ApplicationController
  def index
    puts "hit route"
    render json: Collaborator.all
  end
end
