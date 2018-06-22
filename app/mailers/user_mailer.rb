class UserMailer < ApplicationMailer
	default from: 'no-reply@jungle.com'
	
	def order_receipt(order, user)
		@order = order
		@user = user
		mail(to: @user.email, subject: @order.id)
	end
end