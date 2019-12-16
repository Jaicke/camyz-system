class Backoffice::ProjectsController < BackofficeController
  before_action :set_project, only: [:edit, :update, :destroy, :show]

  def index
    @projects = Project.order(:order)
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to backoffice_projects_path, notice: "Projeto criado com sucesso."
    else
      render :new
    end
  
  end
  
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit  
  end
  
  def update
    if @project.update(project_params)
      redirect_to backoffice_projects_path, notice: "Projeto atualizado com sucesso."
    else
      render :edit
    end
  end
  
  def destroy
    @project.destroy
    redirect_to backoffice_projects_path, notice: "Usuário excluído com sucesso."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:order, :name, :description, :active, :cover, :template)
  end
end
