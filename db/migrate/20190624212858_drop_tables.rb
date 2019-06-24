class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_comments
    drop_table :products
    drop_table :categories
  end
end
