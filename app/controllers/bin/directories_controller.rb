require 'bin/file'
Bin::File

module Bin
  class DirectoriesController < ApplicationController
    before_filter do
      Dir.chdir(::File.join(Rails.root, "uploads", current_user.to_param))
    end

    def new
    end

    def create
    end

    def show
      @dirname = params[:directory]
      @subdirs = Dir["*"].reject{ |i| ::File.file?(i) }.sort
      @files = File.under(@dirname)
    end
  end
end
