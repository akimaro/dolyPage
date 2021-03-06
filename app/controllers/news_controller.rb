class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def new
    @news = News.new
  end
  
  def show
    @news = News.all
  end
  
  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(news_params)
      @news = News.all
      render "index"
    else
      render "edit"
    end
  end
  
  def create
    @news = News.new(news_params)
    
    if @news.save
      @news = News.all
      render "index"
    else
      render "new"
    end
  end

  def destroy
    News.find(params[:id]).destroy
    flash[:success] = "news deleted"
    redirect_to "/news"
  end

  private
  
  def news_params
      params.require(:news).permit(:title, :date, :kind,
                                   :detail)
  end

end
