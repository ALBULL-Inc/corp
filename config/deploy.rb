lock '3.7.2'

set :log_level, :info

set :application, 'railly'
set :repo_url, 'git@github.com:ALBULL-Inc/railly.git'

set :rbenv_ruby, File.read('.ruby-version').strip

set :linked_files, %W{config/database.yml config/settings/#{fetch :stage}.yml public/sitemap.xml.gz .env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle}

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app,:web), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      invoke 'unicorn:restart'
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
