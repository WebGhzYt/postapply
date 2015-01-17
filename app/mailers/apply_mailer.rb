class ApplyMailer < ApplicationMailer
default from: 'engrohitjain5@gmail.com'
 
  def welcome_email(user)
    @user = user
    
    @url  = 'https://firstass.herokuapp.com'
    mail(to: @user.email, subject: 'Thanks For Apply For Job')
  end
   def emp_email(user)
  	@user = user
    #@sender= "sapna.parmar05@gmail.com"
    @url  = 'https://firstass.herokuapp.com'
    mail(to: @user.email, subject: 'Applyed By User for Job Launch by you')
 # @sender.send_message(to: @user.eamil, subject: 'Welcome to My Awesome Site')
  end

end
