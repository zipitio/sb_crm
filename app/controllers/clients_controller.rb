class ClientsController < ApplicationController
	
	def index
		@clients = Client.all
	end

	def show
		@client = Client.find(params[:id])
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(params.require(:client).permit(:first_name, :last_name, :company))
		
		if @client.save
			flash[:notice] = "Client was successfully saved"
			redirect_to @client
		else 
			render 'new'
		end
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])

		if @client.update(params.require(:client).permit(:first_name, :last_name, :company))
			flash[:notice] = "Client was successfully updated"
			redirect_to @client
		else
			render :edit, status: :unprocessable_entity
		end
	end
end