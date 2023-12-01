# class UserMailer < ApplicationMailer
#   	require 'sendgrid-ruby'
# 	include SendGrid
# 	default from: 'mehsan78677@gmail.com'

# 	def event_created_email(user)
# 		from = Email.new(email: 'mehsan78677@gmail.com')
# 		to = Email.new(email: user.email)
# 		subject = 'Sending with SendGrid is Fun'
# 		content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
# 		mail = Mail.new(from, subject, to, content)

# 		sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
# 		response = sg.client.mail._('send').post(request_body: mail.to_json)
# 		puts response.status_code
# 		puts response.body
# 		puts response.headers
# 	end
# end
class UserMailer < ApplicationMailer
	default :from => 'mehsan78677@gmail.com'
	#Email regarding event creation confirmation 
	def event_created_email(user,event)
		@user = user
		@event = event
		mail( :to => @user.email,
		:subject => "Thanks for Creating New Event on Eventify #{@event.title}"  )
	end

	# two factor authentication code
	def confirmation_code_email(user)
	    @user = user
	    mail( :to => @user.email,
	     :subject => 'Confirmation Code for Eventify')
	end

	# Review response mailer
	def review_event_email(user, event)
	  @user = user
	  @event = event
	  puts "ReviewJob is processing in Sidekiq for hahahaha Event Created by #{event.user.email} and Reviewed by #{user.email}...."
	  mail(
	    to: @event.user.email,
	    subject: "#{@user.email} has added feedback to your event #{@event.title}"
	  )
	end

end







