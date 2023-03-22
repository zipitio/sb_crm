class ClientsController < ApplicationController
	before_action :set_client, only: [:show, :edit, :update, :destroy, :welcome]

	def index
		@clients = Client.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		@client.user = current_user
		if @client.save
			flash[:notice] = "Client was successfully saved"
			redirect_to @client
		else 
			render 'new', status: :unprocessable_entity
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

	def list
		clients = Client.order("#{params[:column]} #{params[:direction]}")
		render(partial: 'clients', locals: { clients: clients})
	end

	def welcome
		if @client.email.present?
			UserMailer.with(client: @client).welcome.deliver_later
			flash[:notice] = "Welcome email sent to client"
			redirect_to @client
		else
			flash[:error] = "Please add an email to this client"
			redirect_to @client
		end
	end

	private

	def set_client
		@client = Client.find(params[:id])
	end

	def client_params
		params.require(:client).permit(:first_name, :last_name,
		 :company, :status, :whatsapp, :email, :notes, :phone, :industry,
		 :location, :facebook, :instagram, :linkedin)
	end
end