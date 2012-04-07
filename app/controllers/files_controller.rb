class FilesController < ApplicationController
  def index
    @files = Bin::File.order(:name).page(params[:page]).per_page(10)
  end
end
