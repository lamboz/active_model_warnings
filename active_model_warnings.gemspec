# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_model_warnings/version'

Gem::Specification.new do |spec|
  spec.name          = "active_model_warnings"
  spec.version       = ActiveModelWarnings::VERSION
  spec.authors       = ["Luis Alfredo Lorenzo"]
  spec.email         = ["luis.alfredo@ciencias.unam.mx"]

  spec.summary       = %q{Compliant validtions for ActiveModel.}
  spec.description   = %q{This is useful when you want to define optional validations for a resource and keep it valid.}
  spec.homepage      = "https://github.com/babasbot/active_model_validations"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("activemodel", ">= 3.0.0")

  spec.add_development_dependency("rspec")
  spec.add_development_dependency("coveralls")
  spec.add_development_dependency('appraisal')
  spec.add_development_dependency("sqlite3")
  spec.add_development_dependency("activerecord", ">= 3.0.0")
end
