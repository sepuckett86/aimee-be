require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.org', password: 'test')
    assert user.valid?
  end

  test 'user with email lacking period should be invalid' do
    user = User.new(email: 'test@test', password: 'test') 
    assert_not user.valid?
  end

  test 'user with email lacking @ sign should be invalid' do
    user = User.new(email: 'test.com', password: 'test') 
    assert_not user.valid?
  end

  test 'user with @ and period out of order should be invalid' do
    user = User.new(email: 'test.com@test', password: 'test') 
    assert_not user.valid?
  end

  test 'user with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password: 'test')
    assert_not user.valid?
  end

  test 'password_confirmation that is not the same as password_digest is invalid' do
    user = User.new(email: 'test@test.com', password: 'test', password_confirmation: 'test1') 
    assert_not user.valid?
  end
end
