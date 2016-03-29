class OrderTicketType < ActiveRecord::Base
	# based on https://www.youtube.com/watch?v=_ju80Ft-s0s
	belongs_to :order
	belongs_to :ticket_type

end
