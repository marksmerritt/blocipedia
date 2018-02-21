class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
    @wikis = @wikis.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki Created!"
      redirect_to @wiki
    else
      flash[:error] = "Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki Updated!"
      redirect_to @wiki
    else
      flash[:error] = "Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "Wiki was deleted!"
      redirect_to wikis_path
    else
      flash[:error] = "Please try again."
      render :show
    end
  end

  def search
    query = params[:w].presence || "*"
    @wikis = Wiki.search(query, fields: [:title], suggest: true)
  end

  def autocomplete
    render json: Wiki.search(params[:term], fields: [{title: :text_start}], limit: 10).map(&:title)
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
