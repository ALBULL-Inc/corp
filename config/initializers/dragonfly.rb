require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "728e8a3f0f1908ee70da910356eff41da60fa23752af8b3de96503016eda5d27"

  url_format "/media/:job/:sha/:name"

#  datastore :file,
#    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
#    server_root: Rails.root.join('public')

  datastore :s3,
    bucket_name: ENV['S3_BUCKET'],
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET'],
    url_host: ENV['S3_CDN_HOST'],
    region: 'ap-northeast-1'
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
