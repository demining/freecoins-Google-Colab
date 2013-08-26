require './app'
require 'coveralls'
Coveralls.wear!

# All we do here is run the application.
run Sinatra::Application
