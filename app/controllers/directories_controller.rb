class DirectoriesController < ApplicationController
  before_filter do
    @root = current_user.root_dir
    @dirs = Directory.where(:user_id => current_user.id)
  end

  def new
    @basedir = Directory.find(params[:dir])
    @dir = @basedir.subdirs.new
  end

  def create
    @dir = Directory.new(params[:directory])
    if @dir.save
      redirect_to directory_path(@dir.fullname), notice: "Erfolgreich Verzeichnis angelegt"
    else
      flash.now[:alert] = "Fehler beim Verzeichnisanlegen"
      render :new 
    end
  end

  def show
    dirname = "/" + params[:dir].to_s
    @root.subtree.arrange
    @dir = @dirs.find_by_fullname(dirname)
    @nodes = @dir.children.order("type desc, name asc")
    @subdirs = @nodes.where(:type => "Directory")
  end

  def edit
    @dir = Directory.find(params[:id])
  end

  def update
    @dir = Directory.find(params[:id])
    if @dir.update_attributes(params[:directory])
      redirect_to directory_path(@dir.parent.fullname.slice(1..-1)), notice: "Erfolgreich Verzeichnis bearbeitet"
    else
      flash.now[:alert] = "Fehler beim Verzeichnis bearbeiten"
      render :new 
    end
  end
end
