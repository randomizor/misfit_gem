$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'misfit_gem'

RSpec.configure do |config|
  config.mock_with :rspec
end