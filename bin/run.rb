require_relative '../config/environment'

cli = Interface.new
cli.welcome
sleep 2
cli.user_options
cli.user_choice
