class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.string :location
      t.float :number_of_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
