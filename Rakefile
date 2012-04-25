#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Filemanager::Application.load_tasks

require 'annotate/tasks'

# customize annotate task
ENV['position_in_class']   = "after"
ENV['position_in_fixture'] = "after"
ENV['show_indexes']        = "true"
ENV['include_version']     = "true"
