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
    upload_file = params[:project][:upload_file]
    img = params[:project][:img]

    if upload_file != nil
      filename = upload_file.original_filename
      
      File.open(Rails.root.join('public','assets','projects',@project.year.to_s,filename), "wb"){|f|
        f.write(upload_file.read)
      }
      @project.filename = filename
    end
    if img != nil
      imgfilename = img.original_filename

      File.open(Rails.root.join('public','assets','images','projects',@project.year.to_s,imgfilename), "wb"){|f|
        f.write(img.read)
      }
      @project.imgfilename = imgfilename
    end


    if @project.update_attributes(project_params)
      @projects = Project.all
      render "index"
    else
      render "edit"
    end
  end

  def create
    @project = Project.new(project_params)
    upload_file = params[:project][:upload_file]
    img = params[:project][:img]
    
    if upload_file != nil
      filename = upload_file.original_filename     
      File.open(Rails.root.join('public','assets','projects',@project.year.to_s,filename), "wb"){|f|
        f.write(upload_file.read)
      }
      @project.filename = filename
    end
    
    if img != nil
      imgfilename = img.original_filename
      File.open(Rails.root.join('public','assets','images','projects',@project.year.to_s,filename), "wb"){|f|
        f.write(img.read)
      }
      @project.imgfilename = imgfilename
    end

    if @project.save
      @projects = Project.all
      render "index"
    else
      render "new"
    end
  end

  def download
    @pj = Project.find(params[:id])
    send_file Rails.root.join('public','assets','projects',@pj.year.to_s,@pj.filename)
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
