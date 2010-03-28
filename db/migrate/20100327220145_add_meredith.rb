class AddMeredith < ActiveRecord::Migration
  def self.up
    u = User.build(:email => 'meredithda8@aol.com', :password => 'somi', :admin => true, :spamValidation=>"1234")
    u.save(false)
  end

  def self.down
    User.find_by_email('meredithda8@aol.com').destroy
  end
end
