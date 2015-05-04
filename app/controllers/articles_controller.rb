class ArticlesController < ApplicationController
  # def index
  #   puts "hit route"
  #   render json: Article.all
  # end

  # def show
  #   render json: Article.find(params[:id])
  # end
  def index
    @daily_pass = Lock.find_by(property: "admin_pass").value
    if params["admin_pass"] != @daily_pass
      render json: Article.all
    else
      @articles = Article.all
      @new_article = Article.new()
    end
  end
  def show
    @daily_pass = Lock.find_by(property: "admin_pass").value
    if params["admin_pass"] != @daily_pass
      redirect_to("/")
    else
      @article = Article.find(params["id"])
    end
  end

  def create
    Article.create(article_params)
    redirect_to("/")
  end

  def update
    Article.find(params["id"]).update_attributes(article_params)
    redirect_to("/")
  end

  def destroy
    Article.find(params["id"]).destroy
    redirect_to("/")
  end

  private

  def article_params
      params.require(:article).permit(
        :title, 
        :subtitle, 
        :content, 
        :published,
        :published_on)
  end
end
