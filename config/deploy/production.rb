# -*- coding: utf-8 -*-
require 'aws-sdk'

set :rails_env, 'production'
set :deploy_to, "/var/www/railly/#{fetch :rails_env}"
set :branch, 'master'
set :pty, false

servers = %w{
  albull-corp
}
role :app, servers
role :web, servers
role :db,  servers.first


namespace :slack do
  namespace :deploy do
    task :starting do
      run_locally do
        notifier = Slack::Notifier.new Settings.slack["system"]["webhook_url"], username: "deploy", channel: "#system"
        notifier.ping "<!channel> :rocket: #{ENV['USER'] || ENV['USERNAME']} が #{fetch :rails_env, 'production'} 環境に railly をdeployします:exclamation:"
      end
    end

    task :finished do
      run_locally do
        notifier = Slack::Notifier.new Settings.slack["system"]["webhook_url"], username: "deploy", channel: "#system"
        notifier.ping "<!channel> :+1: railly のdeployが終了しました:bangbang:"
      end
    end

    task :failed do
      run_locally do
        notifier = Slack::Notifier.new Settings.slack["system"]["webhook_url"], username: "deploy", channel: "#system"
        notifier.ping "<!channel> :bow: railly のdeployが失敗しました:interrobang:"
      end
    end
  end
end

after 'deploy:starting', 'slack:deploy:starting'
after 'deploy:finished', 'slack:deploy:finished'
after 'deploy:failed',   'slack:deploy:failed'
