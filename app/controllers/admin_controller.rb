class AdminController < ApplicationController
  def index
    @admin_company_contact = AdminCompanyContact.new
    @admin_company_contact = AdminCompanyContact.first
  end

  def clients
    @clients = Client.all.includes(:user)
  end

  def users
    @users = User.all
  end
end
