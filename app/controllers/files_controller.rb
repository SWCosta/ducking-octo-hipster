class FilesController < ApplicationController
  def new
    @file = Bin.new
  end
end
