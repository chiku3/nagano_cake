class RenameAddregerColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :addreger, :address
  end
end
