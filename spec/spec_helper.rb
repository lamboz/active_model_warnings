$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../resources', __FILE__)

require 'active_model_warnings'
require 'active_record'
require 'coveralls'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
Coveralls.wear!

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
load File.dirname(__FILE__) + '/support/resource.rb'
