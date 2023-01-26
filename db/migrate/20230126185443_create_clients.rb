class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.string :company
      t.string :industry
      t.string :status
      t.string :location
      t.text :notes
      t.string :facebook
      t.integer :whatsapp
      t.string :instagram
      t.string :linkedin

      t.timestamps
    end
  end
end
