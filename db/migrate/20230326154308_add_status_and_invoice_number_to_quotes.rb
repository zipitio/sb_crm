class AddStatusAndInvoiceNumberToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_column :quotes, :status, :integer
    add_column :quotes, :invoice_number, :string
  end
end
