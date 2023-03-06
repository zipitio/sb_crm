class CreateAdminCompanyContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_company_contacts do |t|
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
