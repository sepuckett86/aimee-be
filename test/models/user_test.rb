require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.org', password_digest: 'test')
    assert user.valid?
  end

  test 'user with email lacking period should be invalid' do
    user = User.new(email: 'test@test', password_digest: 'test') 
    assert_not user.valid?
  end

  test 'user with email lacking @ sign should be invalid' do
    user = User.new(email: 'test.com', password_digest: 'test') 
    assert_not user.valid?
  end

  test 'user with @ and period out of order should be invalid' do
    user = User.new(email: 'test.com@test', password_digest: 'test') 
    assert_not user.valid?
  end

  test 'user with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: 'test')
    assert_not user.valid?
  end
end
