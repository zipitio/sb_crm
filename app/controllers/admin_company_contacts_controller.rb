class AdminCompanyContactsController < ApplicationController

  def edit
    @acc = AdminCompanyContact.first
  end

  def update
    @acc = AdminCompanyContact.first
    if @acc.update(acc_params)
      flash[:notice] = "Company contact was successfully updated"
      redirect_to admin_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

	private
  def acc_params
    params.require(:admin_company_contact).permit(:email, :phone)
  end
end
