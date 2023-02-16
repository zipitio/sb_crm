class AdminController < ApplicationController
  def index
  end

  def clients
  end

  def users
    @users = User.all
  end
end
