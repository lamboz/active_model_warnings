$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../resources', __FILE__)

require 'active_model_warnings'
require 'coveralls'

Coveralls.wear!

autoload :Resource, 'resources/resource'
