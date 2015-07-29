class AddCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :boolean, null: false, default: false
  end
end
