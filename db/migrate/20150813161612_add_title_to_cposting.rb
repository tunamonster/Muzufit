class AddTitleToCposting < ActiveRecord::Migration
  def change
    add_column :cpostings, :title, :string
  end
end
