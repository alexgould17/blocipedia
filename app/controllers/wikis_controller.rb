class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action { @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {}) }
  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    if @wiki.private && @wiki.user.standard?
      flash[:alert] = "You are not allowed to create private wikis!"
      render :new
    else
      authorize @wiki
      if @wiki.save
        redirect_to @wiki, notice: "New wiki \"#{@wiki.title}\" created!"
      else
        flash[:alert] = "Error saving new wiki \"#{@wiki.title}\", please try again."
        render :new
      end
    end
  end

  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    @wiki.user = current_user

    # Check to see if we need to add/remove collaborators & make the necessary changes
    email = params[:wiki][:users]
    if email && email != ""
      user = User.where(email: email).first
      if !user
        flash[:alert] = "No user found with email: #{email}."
        render :edit
        return
      end
      collaborator = Collaborator.where(user_id: user.id, wiki_id: @wiki.id)
      if !collaborator.empty?
        puts collaborator
        unless collaborator.destroy
          flash[:alert] = "Error removing user #{user.name} as a collaborator. Please try again."
          render :edit
          return
        end
      else
        collaborator = Collaborator.new(user_id: user.id, wiki_id: @wiki.id)
        unless collaborator.save
          flash[:alert] = "Error adding user #{user.name} as a collaborator. Please try again."
          render :edit
          return
        end
      end
    end

    # Make sure standard users aren't trying to edit private wikis on the down low
    if @wiki.private && @wiki.user.standard?
      flash[:alert] = "You are not allowed to create private wikis!"
      render :edit
      return
    end

    # Authorize via pundit policy & try to save
    authorize @wiki
    if @wiki.save
      redirect_to @wiki, notice: "Wiki \"#{@wiki.title}\" updated."
    else
      render :edit, "Update on wiki \"#{@wiki.title} failed.\" Please try again."
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      redirect_to root_path, notice: "Wiki \"#{@wiki.title}\" deleted."
    else
      render :show, alert: "Failed to delete wiki \"#{@wiki.title}\". Please try again."
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user)
  end
end
