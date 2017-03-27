class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    if @wiki.save
      redirect_to @wiki, notice: "New wiki #{@wiki.title} created!"
    else
      render :new, alert: "Error saving new wiki #{@wiki.title}, please try again."
    end
  end

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    @wiki.user = current_user
    if @wiki.save
      redirect_to @wiki, notice: "Wiki #{@wiki.title} updated."
    else
      render :edit, "Update on #{@wiki.title} failed. Please try again."
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      redirect_to root_path, notice: "Wiki #{@wiki.title} deleted."
    else
      render :show, alert: "Failed to delete #{@wiki.title}. Please try again."
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user)
  end
end
