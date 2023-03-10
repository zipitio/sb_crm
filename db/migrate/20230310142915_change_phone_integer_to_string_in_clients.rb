class ChangePhoneIntegerToStringInClients < ActiveRecord::Migration[7.0]
  def change
    change_column :clients, :phone, :string
    change_column :clients, :whatsapp, :string
  end
end
