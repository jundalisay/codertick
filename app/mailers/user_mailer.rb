class UserMailer < ApplicationMailer

	def user_registration(user)
		mail(:to => user.email, :subject => 'User Registered!')
	end

end