class UserMailer < ApplicationMailer
	def welcome
		@client = params[:client]
		client_name = @client.first_name + " " + @client.last_name
		@greeting = "Hello " + client_name
		attachments['recunet_logo.png'] = File.read('app/assets/images/recunet_logo.png')
		mail(
			from: "SGRiveraC@gmail.com",
			to: "rodrigoemfr@gmail.com",#email_address_with_name(@client.email, client_name ),
			cc: User.all.pluck(:email),
			bcc: "master@test.org",
			subject: "Bienvenido a Spacebyn!"
			)
	end
end
