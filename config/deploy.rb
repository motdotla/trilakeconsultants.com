# =============================================================================
# ROLES
# =============================================================================
role :app, "174.142.75.247"
role :web, "174.142.75.247"
role :db,  "174.142.75.247", :primary => true
 
# =============================================================================
# SETUP
# =============================================================================
set :user, 'scottmotte'
set :application, "trilakeconsultants.com"

# =============================================================================
# DEPLOY TO
# =============================================================================
set :deploy_to, "/home/scottmotte/apps/trilakeconsultants.com"
set :scm_verbose, true
set :use_sudo, false

# # =============================================================================
# # REPOSITORY
# # =============================================================================
set :scm, "git"
set :repository,  "git@github.com:scottmotte/trilakeconsultants.com.git"
set :branch, "master"
set :deploy_via, :remote_cache

# =============================================================================
# SSH OPTIONS
# =============================================================================
default_run_options[:pty] = true
ssh_options[:paranoid] = false
 
# =============================================================================
# RAKE TASKS & OTHER SERVER TASKS
# =============================================================================
namespace :deploy do
  # override Rails related callbacks
  task :finalize_update do
  end
 
  task :migrate do
  end
  
  desc 'restart app'
  task :restart do
  end
  
  desc "Create symlink to public_html/trilakeconsultants.com/public"
  task :symlinkify do
    run "rm -rf /home/scottmotte/public_html/trilakeconsultants.com/public; ln -s #{current_path}/output/ /home/scottmotte/public_html/trilakeconsultants.com/public"
  end
end
 
after "deploy", "deploy:cleanup", "deploy:symlinkify"