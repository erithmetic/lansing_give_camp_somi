require 'spec_helper'

describe PasswordReset do
  before(:each) do
    @person = Factory.create(:person)
  end
  describe :save do
    context 'new record' do
      it 'should send a notification to the person by email' do
        PersonMailer.should_receive(:deliver_password_reset_notification)
        pr = PasswordReset.new(:email_or_handle => @person.email)
        pr.should be_valid
        pr.save
      end
      it 'should send a notification to the person by handle' do
        PersonMailer.should_receive(:deliver_password_reset_notification)
        pr = PasswordReset.new(:email_or_handle => @person.handle)
        pr.should be_valid
        pr.save
      end
      it 'should set Person#preishable_token' do
        pr = PasswordReset.new(:email_or_handle => @person.email)
        pr.person = @person
        @person.should_receive(:reset_perishable_token!)
        pr.save
      end
    end
    context 'existing reset' do
      it 'should set the password to the newly-entered password' do
        old_password = @person.crypted_password
        Person.stub!(:find_using_perishable_token).and_return(@person)
        pr = PasswordReset.find('squash_coin')
        pr.password = 'aaaaa'
        pr.person = @person
        pr.save.should be_true

        p = Person.find_by_handle(@person.handle)
        old_password.should_not == p.crypted_password
      end
    end
  end
end
