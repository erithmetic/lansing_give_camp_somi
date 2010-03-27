class AddMeredith < ActiveRecord::Migration
  def self.up
    User.create!(:email => 'meredithda8@aol.com', :password => 'somi', :admin => true)
  end

  def self.down
    User.find_by_email('meredithda8@aol.com').destroy
  end
end
