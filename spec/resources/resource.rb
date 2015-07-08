class Resource
  include ActiveModel::Validations
  attr_accessor :password

  validate :password_length
  validate :blank_password

  def initialize(password)
    @password = password
  end

  private

  def password_length
    warnings.add(:password, "min length should be 5") if password.length < 5
  end

  def blank_password
    errors.add(:password, 'should not be blank') if password.length == 0
  end
end
