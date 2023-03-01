class ChangeQuoteTypeToIntegerInQuotes < ActiveRecord::Migration[7.0]
  def change
    change_column :quotes, :quote_type, :integer
  end
end
