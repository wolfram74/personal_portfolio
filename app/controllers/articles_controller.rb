class ArticlesController < ApplicationController
  def index
    puts "hit route"
    render json: Article.all
  end

  def show
    render json: Article.find(params[:id])
  end
end
