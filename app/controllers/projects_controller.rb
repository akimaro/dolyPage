class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def show
    @project = Project.all
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      @projects = Project.all
      render "index"
    else
      render "edit"
    end
  end

  def create
    @project = Project.new(project_params)
    file = params[:file]
    if @project.save
      @projects = Project.all
      
      if upload_file != nil
        content[:upload_file] = upload_file.read
        content[:upload_file_name] = upload_file.original_filename
      end
      
      render "index"
    else
      render "new"
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "project deleted"
    redirect_to "/projects"
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :filename, :researcher,
                                    :year, :imgfilename)
  end

end
