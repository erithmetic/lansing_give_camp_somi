class CorrectTypo < ActiveRecord::Migration
  def self.up
    remove_column :events, :maxiumum_volunteers
    add_column :events, :maximum_volunteers, :integer
  end

  def self.down
  end
end
