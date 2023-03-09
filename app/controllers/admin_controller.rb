class AdminController < ApplicationController
  def index
    if AdminCompanyContact.all.count == 0
      @acc = AdminCompanyContact.new
    end
    @acc = AdminCompanyContact.first
  end

  def clients
    @clients = Client.all.includes(:user)
  end

  def users
    @users = User.all
  end


end

