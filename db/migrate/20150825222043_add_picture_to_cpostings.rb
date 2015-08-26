class AddPictureToCpostings < ActiveRecord::Migration
  def change
    add_column :cpostings, :picture, :string
  end
end
