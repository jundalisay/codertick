class CreateOrderTicketTypes < ActiveRecord::Migration
  def change
    create_table :order_ticket_types do |t|
    	t.integer :order_id
    	t.integer :ticket_type_id
    	
      t.timestamps null: false
    end
  end
end
