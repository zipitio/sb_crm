class AddQuoteExtraToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_column :quotes, :extra_amount, :integer
  end
end
