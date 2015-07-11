# ActiveModelWarnings
[![Gem Version](https://badge.fury.io/rb/active_model_warnings.svg)](http://badge.fury.io/rb/active_model_warnings)
[![Build Status](https://travis-ci.org/babasbot/active_model_warnings.svg)](https://travis-ci.org/babasbot/active_model_warnings)
[![Coverage Status](https://coveralls.io/repos/babasbot/active_model_warnings/badge.svg?branch=master&service=github)](https://coveralls.io/github/babasbot/active_model_warnings?branch=master)
[![Code Climate](https://codeclimate.com/github/babasbot/active_model_warnings/badges/gpa.svg)](https://codeclimate.com/github/babasbot/active_model_warnings)

Compliant validtions for ActiveModel. This is useful when you want to define optional validations for a resource and keep it valid.

Adds `compliant?` and `warnings` methods to `ActiveModel::Validations` that are similar to `valid?` and `errors` but for warnings.

See [ActiveModel::Validations](http://api.rubyonrails.org/classes/ActiveModel/Validations.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_model_warnings'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_model_warnings

## Usage
### ActiveRecord
```ruby
class User < ActiveRecord::Base
  attr_accessor :password
  validate :password_length  # may cause an error
  validate :blank_password   # may cause a warning

  private

  def password_length
    warnings.add(:password, "min length should be 5") if password.length < 5
  end

  def blank_password
    errors.add(:password, 'should not be blank') if password.length == 0
  end
end

user = User.new(:password => 'safe')
user.valid?
# => true
user.compliant?
# => false
```
### ActiveModel
```ruby
class User
  include ActiveModel::Validations
  attr_accessor :password

  validate :blank_password  # may cause an error
  validate :password_length # may cause a warning

  def initialize(password)
    @password = password
  end

  private

  def blank_password
    errors.add(:password, 'should not be blank') if password.length == 0
  end

  def password_length
    warnings.add(:password, "min length should be 5") if password.length < 5
  end
end

user = User.new('safe')
user.valid?
# => true
user.compliant?
# => false
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/babasbot/active_model_warnings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## TODO

 - Support for `ActiveModel::Validations::HelperMethods`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
