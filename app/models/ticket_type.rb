class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :order_ticket_types
  has_many :orders, :through => :orders_ticket_types


  def max_allowed_tickets
  	(1..max_q.to_i).to_a
  end

end