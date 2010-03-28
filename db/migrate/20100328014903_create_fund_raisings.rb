class CreateFundRaisings < ActiveRecord::Migration
  def self.up
    create_table :fund_raisings do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :fund_raisings
  end
end
