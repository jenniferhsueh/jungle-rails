class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
   
    def order_receipt
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: #{@order.id})
    end
  end