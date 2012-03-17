#trying to follow Dreamhost instructions
set :scm_command, "/usr/bin/git" #updated version of git on ?server in user directory
set :local_scm_command, "git" #correct path to local ?git 

set :application, "www.nielsenfamily.ca"

# version control config
set :scm_username, 'Gajol'
set :scm_password, 'pinball2day'set :repository,  "git@github.com:Gajol/SwimMeetUpload.git"
set :scm, 'git'  # syntax from http://help.github.com/deploy-with-capistrano/
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true 		# This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# deploy config
# git-specific based on dreamhost ( http://wiki.dreamhost.com/Capistrano )
set :deploy_to, "nielsenfamily.ca"
set :deploy_via, :remote_cache   # dreamhost says this
# set :deploy_via, :export  # syntax from http://help.github.com/deploy-with-capistrano
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true


# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


