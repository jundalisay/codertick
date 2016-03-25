class Order < ActiveRecord::Base
	belongs_to :user #jun added
	belongs_to :event #jun added
	has_many :ticket_types #jun added
end
