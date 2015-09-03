class AddStartsAtToCpostings < ActiveRecord::Migration
  def change
    add_column :cpostings, :starts_at, :datetime
  end
end
