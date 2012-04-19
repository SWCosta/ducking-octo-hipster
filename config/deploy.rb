set :application, "Raubkopien-Bunker"
set :repository,  "git@github.com:yuszuv/ducking-octo-hipster.git"

set :scm, :git
ssh_options[:forward_agent] = true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#use capistrano with rvm
set :rvm_ruby_string, "ruby-1.9.2-p318@filemanager"
set :rvm_type, :system
require 'rvm/capistrano'


set :deploy_to, "/opt/filemanager"

server "fucklove.de", :web, :app, :db, :primary => true
set :user, "deployer"
set :use_sudo, false

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

task :check_rvm do
  run "#{try_sudo} type rvm | head -1"
  run "#{try_sudo} printenv"
end

task :printenv do
  run "#{try_sudo} printenv"
end

task :foobar do
  run "echo 'bar foo'"
end

task :echo_path do
  run "echo \${PATH}"
end

task :printenv_bundler do
  run "printenv | grep -i bundler"
end



before :deploy do
  run ""
end

namespace :deploy do
  task :include_db do
    run "echo 'bar!!!!!'"
    run "touch #{release_path}/config/database.yml"
    run "ln -nfs {shared_path}/config/database.yml !:$"
  end
end

before "deploy:finalize_update", "deploy:include_db"
