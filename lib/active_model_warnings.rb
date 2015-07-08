require "active_model_warnings/version"
require "active_model_warnings/compliance"
require "active_model"

ActiveModel::Validations.send(:include, ActiveModelWarnings::Compliance)
