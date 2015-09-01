class AddPictureToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :picture, :string
  end
end
