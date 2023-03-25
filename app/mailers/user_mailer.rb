class UserMailer < ApplicationMailer
	def welcome
		@client = params[:client]
		client_name = @client.first_name + " " + @client.last_name
		@greeting = "Hola " + client_name + "!"
		attachments['recunet_logo.png'] = File.read('app/assets/images/recunet_logo.png')
		mail(
			from: "SGRiveraC@gmail.com",
			to: email_address_with_name(@client.email, client_name ),
			cc: User.all.pluck(:email),
			bcc: "master@test.org",
			subject: "Bienvenido a Spacebyn!"
			)
	end

	def send_quote(quote_id, client_id)
		#@client = params[:client]
		#@client_name = @client.first_name + " " + @client.last_name
		@quote = Quote.find(quote_id)
		@client = Client.find(client_id)
		attachments['recunet_logo.png'] = File.read('app/assets/images/recunet_logo.png')
		mail(
			from: "SGRiveraC@gmail.com",
			to: email_address_with_name("test@test.com", "Emm"),
			cc: "",
			bcc: "",
			subject: "Cotización de Spacebyn"
			)
	end
end