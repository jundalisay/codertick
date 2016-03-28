class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ticket_type, index: true, foreign_key: true # should have this?
      # t.references :event, index: true, foreign_key: true # should have this?
      # t.integer :price
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
