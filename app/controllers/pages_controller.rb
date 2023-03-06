class PagesController < ApplicationController
	helper_method :resource_name, :resource, :devise_mapping, :resource_class
	skip_before_action :authenticate_user!, :only => [:index]
	def index
		if user_signed_in? 
			redirect_to clients_path
		end
	end

	def stats
		@clients = Client.all
		@quotes = Quote.all
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def resource_class
		User
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def quote

	end

	def download
		pdf = Prawn::Document.new
		pdf.text "Hello World"
		send_data(pdf.render,
			filename: 'hello.pdf',
			type: 'application/pdf')
	end

	def preview
		pdf = Prawn::Document.new
		pdf.text "This is a preview"
		pdf.text "Should only show in preview route"
		pdf.start_new_page
		pdf.text "This is a new page"
		send_data(pdf.render,
			filename: 'hello.pdf',
			type: 'application/pdf',
			disposition: 'inline')
	end
end
