require_relative '../config/environment'

cli = Interface.new
cli.welcoming_message
cli.welcome
sleep 2
cli.user_options

