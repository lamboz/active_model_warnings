# ActiveModelWarnings

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

```ruby
class Resource
  include ActiveModel::Validations
  attr_accessor :password

  validate :password_length

  def initialize(password)
    @password = password
  end

  private

  def password_length
    warnings.add(:password, "min length should be 5") if password.length < 5
  end
end

resource = Resource.new('safe')
resouce.valid?
# => true
resource.compliant?
# => false
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/babasbot/active_model_warnings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## TODO

 - Test with `ActiveRecord`.
 - Support for `ActiveModel::Validations::HelperMethods`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
