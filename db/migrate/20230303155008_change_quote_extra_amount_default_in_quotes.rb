class ChangeQuoteExtraAmountDefaultInQuotes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :quotes, :extra_amount, 0
  end
end
