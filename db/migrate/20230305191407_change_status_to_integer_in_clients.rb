class ChangeStatusToIntegerInClients < ActiveRecord::Migration[7.0]
  def change
    change_column :clients, :status, :integer
  end
end
