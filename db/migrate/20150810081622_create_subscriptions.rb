class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :post_id
      t.integer :subscriber_id

      t.timestamps null: false
    end
    add_index :subscriptions, [:post_id, :subscriber_id], unique: true #user can only subscribe once 
  end
end



