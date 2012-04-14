class DirectoriesController < ApplicationController
  before_filter do
    @root = Directory.where(:user_id => current_user.id)
  end

  def new
    @basedir = @root.find_by_name!(params[:dir])
    @dir = Directory.new(:directory => @basedir)
  end

  def create
    @dir = @root.new(params[:directory])
    if @dir.save
      redirect_to directory_path(@dir.fullname), notice: "Erfolgreich Verzeichnis angelegt"
    else
      flash.now[:alert] = "Fehler beim Verzeichnisanlegen"
      render :new 
    end
  end

  def show
    @dir = @root.find_by_name!("/#{params[:dir]}")
    @subdirs = @dir.subdirs || []
    rescue
      if @root.blank?
        @dir = @root.create!(:basename => "/")
      else
        raise
      end
  end
end
