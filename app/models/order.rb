class Order < ActiveRecord::Base
	belongs_to :user #jun added
	belongs_to :event #jun added
	has_many :orders_ticket_types
	has_many :ticket_types, :through => :orders_ticket_types #jun added
end
