class OrderMailer < ApplicationMailer

	def order_confirmation(order)
		mail(:to => order.user.email, :subject => 'Order_confirmation!')
	end

end