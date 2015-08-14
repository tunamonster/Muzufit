class AddDateToCposting < ActiveRecord::Migration
  def change
    add_column :cpostings, :date, :datetime
  end
end
