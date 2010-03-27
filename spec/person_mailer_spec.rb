require 'spec_helper'

describe PersonMailer do
  describe :password_reset_notification do
    it 'should send a password reset message' do
      person = Factory.build(:person, :perishable_token => 'aaabbbccc')
      mail = PersonMailer.create_password_reset_notification(person)
      mail.to.should include(person.email)
      mail.body.should =~ /\/password_resets\/aaabbbccc\/edit/
    end
  end

  describe :merge_request_confirmation do
    it 'should send a merge message' do
      requestee = Factory.build(:person)
      merge = mock_model(Merge, :to_param => 'abc123', :requester => Factory.build(:person), 
                                :requestee => requestee)
      mail = PersonMailer.create_merge_request_confirmation(merge)
      mail.to.should include(requestee.email)
      mail.body.should =~ /\/merges\/abc123/
    end
  end

  describe :merge_notification do
    it 'should send a merge notification message' do
      requester = Factory.build(:person)
      merge = mock_model(Merge, :requestee => Factory.build(:person), 
                                :requester => requester)
      mail = PersonMailer.create_merge_notification(merge)
      mail.to.should include(requester.email)
      mail.body.should =~ /merge/
    end
  end
end
