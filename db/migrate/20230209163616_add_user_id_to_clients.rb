class AddUserIdToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :user_id, :int
  end
end
