class ClientsController < ApplicationController
	
	def index
		@clients = Client.all
	end

	def show
		@client = Client.find(params[:id])
	end

	def new

	end

	def create
		@client = Client.new(params.require(:client).permit(:first_name, :last_name, :company))
		@client.save
		redirect_to @client
	end


end