require 'spec_helper'

describe User do
  it 'should be an authorizable user' do
    u = User.new
    u.should respond_to(:password)
    u.should respond_to(:reset_password)
  end
end
