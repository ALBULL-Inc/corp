lock '3.7.2'

set :log_level, :info

set :application, 'corp'
set :repo_url, 'git@github.com:your-corp/corp.git'

set :rbenv_ruby, File.read('.ruby-version').strip

#set :linked_files, %W{.env config/database.yml config/settings/#{fetch :stage}.yml config/settings/slack_notifier.yml}
set :linked_files, %W{config/database.yml config/settings/slack.yml config/settings/#{fetch :stage}.yml public/sitemap.xml.gz .env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle}

set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app,:web), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'unicorn:restart'
      #invoke 'unicorn:stop'
      #invoke 'unicorn:start'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:app,:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
