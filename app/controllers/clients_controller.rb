class ClientsController < ApplicationController
	
	before_action :set_client, only: [:show, :edit, :update, :destroy]

	def index
		@clients = Client.all
	end

	def show
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		
		if @client.save
			flash[:notice] = "Client was successfully saved"
			redirect_to @client
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		if @client.update(client_params)
			flash[:notice] = "Client was successfully updated"
			redirect_to @client
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@client.destroy
		flash[:notice] = "Client was successfully deleted"
		redirect_to clients_path
	end

	private

	def set_client
		@client = Client.find(params[:id])
	end

	def client_params
		params.require(:client).permit(:first_name, :last_name, :company)
	end
end