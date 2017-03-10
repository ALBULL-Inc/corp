# -*- coding: utf-8 -*-
require 'aws-sdk'

set :rails_env, 'production'
set :deploy_to, "/var/www/corp/#{fetch :rails_env}"
set :branch, 'master'
set :pty, false

slack_yml = YAML.load_file("config/settings/slack.yml")

servers = %w{
  yours@ec2-52-196-109-227.ap-northeast-1.compute.amazonaws.com
}
role :app, servers
role :web, servers
role :db,  servers.first


namespace :slack do
  namespace :deploy do
    task :starting do
      run_locally do
        notifier = Slack::Notifier.new slack_yml["slack"]["webhook_url"]["system"], username: "deploy", channel: "#system"
        notifier.ping "<!channel> :rocket: #{ENV['USER'] || ENV['USERNAME']} が #{fetch :rails_env, 'production'} 環境に corp をdeployします:exclamation:"
      end
    end

    task :finished do
      run_locally do
        notifier = Slack::Notifier.new slack_yml["slack"]["webhook_url"]["system"], username: "deploy", channel: "#system"
        notifier.ping "<!channel> :+1: corp のdeployが終了しました:bangbang:"
      end
    end

    task :failed do
      run_locally do
        notifier = Slack::Notifier.new slack_yml["slack"]["webhook_url"]["system"], username: "deploy", channel: "#system"
        notifier.ping "<!channel> :bow: corp のdeployが失敗しました:interrobang:"
      end
    end
  end
end

after 'deploy:starting', 'slack:deploy:starting'
after 'deploy:finished', 'slack:deploy:finished'
after 'deploy:failed',   'slack:deploy:failed'
