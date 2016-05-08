# -*- coding: utf-8 -*-
require 'aws-sdk'

set :rails_env, 'production'
set :deploy_to, "/var/www/corp/#{fetch :rails_env}"
set :branch, 'master'
set :pty, false

deploy_yml = YAML.load_file("config/deploy/deploy.yml")

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
        notifier = Slack::Notifier.new deploy_yml["slack"]["webhook_url"], username: "gMusiQ", channel: "#gmusiq"
        notifier.ping "<!channel> :rocket: #{ENV['USER'] || ENV['USERNAME']} が #{fetch :rails_env, 'production'} 環境に gMusiQ をdeployします:exclamation:"
      end
    end

    task :finished do
      run_locally do
        notifier = Slack::Notifier.new deploy_yml["slack"]["webhook_url"], username: "gMusiQ", channel: "#gmusiq"
        notifier.ping "<!channel> :+1: gMusiQ のdeployが終了しました:bangbang:"
      end
    end

    task :failed do
      run_locally do
        notifier = Slack::Notifier.new deploy_yml["slack"]["webhook_url"], username: "gMusiQ", channel: "#gmusiq"
        notifier.ping "<!channel> :bow: gMusiQ のdeployが失敗しました:interrobang:"
      end
    end
  end
end


#after 'deploy:starting', 'slack:deploy:starting'
#after 'deploy:finished', 'slack:deploy:finished'
#after 'deploy:failed',   'slack:deploy:failed'





# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
