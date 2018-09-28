class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.integer :id_product
      t.integer :id_user
      t.string :title
      t.string :comment

      t.timestamps
    end
  end
end
