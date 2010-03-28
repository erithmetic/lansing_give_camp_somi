class AddSubjectToCancellationToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :subject_to_cancellation, :boolean
  end

  def self.down
  end
end
