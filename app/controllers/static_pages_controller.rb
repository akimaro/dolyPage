class StaticPagesController < ApplicationController
  def home
    @news = News.all
  end

  def project
    @projects = Project.all
  end

  def member
  end

  def publication
  end

  def for_student
  end

  def profile
  end

  def access
  end

  def download
    year=params[:year]
    file=params[:name]
    format=params[:format]
    
    path=Rails.root.join('public/assets/projects/', "#{year}/#{file}.#{format}")
#    send_file(path)
  end

  def manage
  end

end
