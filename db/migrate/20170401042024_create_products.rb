class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :prod_id
      t.string :image_url
      t.integer :quantity

      t.timestamps
    end
  end
end
