class ChangeTypeAttributeInQuotes < ActiveRecord::Migration[7.0]
  def change
    rename_column :quotes, :type, :quote_type
  end
end
