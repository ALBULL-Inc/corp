# -*- encoding : utf-8 -*-

current_dir = "/var/www/corp/production/current"
shared_dir  = "/var/www/corp/production/shared"


#listen 8080
listen "/tmp/corp_unicorn.sock"
preload_app true
worker_processes 2
working_directory current_dir

# pid
pid "#{shared_dir}/tmp/pids/unicorn.pid"

# log
stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
