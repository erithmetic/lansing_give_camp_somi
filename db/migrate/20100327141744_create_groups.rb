class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
			t.column :name, :string
      t.timestamps
    end
		
		add_column :users, :group_id, :integer
		add_column :users, :count, :integer
  end

  def self.down
    drop_table :groups
  end
end
