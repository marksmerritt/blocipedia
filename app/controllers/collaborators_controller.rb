class CollaboratorsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.new(collaborator_params)
    
    if @collaborator.save
      flash[:notice] = "Collaborator added!"
      redirect_to @collaborator.wiki
    else
      flash[:alert] = "Please try again."
      redirect_to @collaborator.wiki 
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end