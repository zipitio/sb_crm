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
		render plain: params[:client]
	end


end