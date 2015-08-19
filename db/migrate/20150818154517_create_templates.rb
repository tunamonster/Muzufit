class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.text :content
      t.text :title
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
    add_index :templates, [:user_id, :created_at]
  end
end
