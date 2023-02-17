class AdminController < ApplicationController
  def index
  end

  def clients
    @clients = Client.all.includes(:user)
  end

  def users
    @users = User.all
  end
end
