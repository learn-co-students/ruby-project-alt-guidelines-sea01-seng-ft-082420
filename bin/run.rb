require_relative '../config/environment'
require_relative '../lib/cli.rb'
require 'optparse'
# run from command line w/ ruby bin/run.rb

cli = CommandLineInterface.new
cli.greet
cli.menu
cli.wine_seeking




