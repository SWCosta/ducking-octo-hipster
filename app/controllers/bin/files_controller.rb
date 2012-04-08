module Bin
  class FilesController < ApplicationController
    def index
      @files = Bin::File.order(:name).page(params[:page]).per_page(10)
    end

    def new
      @file = Bin::File.new
    end

    def create
      @file = Bin::File.new(params[:file].merge(:user_id => current_user.id))
      if @file.save
        redirect_to files_path, :notice => "Neue Datei entstanden"
      else
        render :new, flash.now[:alert] => "Datei korrupt"
      end
    end
  end
end
