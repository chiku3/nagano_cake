class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :postal_code
      t.string :addreger
      t.integer :status

      t.timestamps
    end
  end
end
