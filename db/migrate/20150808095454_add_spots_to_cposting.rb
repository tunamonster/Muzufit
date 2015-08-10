class AddSpotsToCposting < ActiveRecord::Migration
  def change
    add_column :cpostings, :spots, :integer
  end
end
