require "active_model_warnings/version"
require "active_model_warnings/compliance"
require "active_record"

ActiveModel::Validations.send(:include, ActiveModelWarnings::Compliance)
ActiveRecord::Base.send(:include, ActiveModelWarnings::Compliance)
