class FilesController < ApplicationController
  before_filter :only => [:new, :edit] do
    @basedir = Directory.find(params[:dir])
  end

  def new
    @file = @basedir.files.new
  end

  def create
    @file = Bin.new(params[:bin])
    if @file.save
      redirect_to directory_path(@file.parent.fullname.slice(1..-1)), :notice => "Erfolgreich Datei erstellt"
    else
      flash.now[:alert] = "Beim Erstellen der Datei ist etwas schiefgelaufen"
      render :new
    end
  end
end
