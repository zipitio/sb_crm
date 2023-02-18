class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :type
      t.integer :amount
      t.integer :client_id

      t.timestamps
    end
  end
end
