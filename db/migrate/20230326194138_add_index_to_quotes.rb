class AddIndexToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_index :quotes, :invoice_number, unique: true
  end
end
