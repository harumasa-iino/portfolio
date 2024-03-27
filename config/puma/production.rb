environment "production"

tmp_path = "#{File.expand_path("../../..", __FILE__)}/tmp"
bind "unix://#{tmp_path}/sockets/puma.sock"

threads 3, 3
workers 2
preload_app!

pidfile "#{tmp_path}/pids/puma.pid"
# stdout_redirect "#{tmp_path}/logs/puma.stdout.log", "#{tmp_path}/logs/puma.stderr.log", true

plugin :tmp_restart
