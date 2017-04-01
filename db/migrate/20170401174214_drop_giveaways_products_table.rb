class DropGiveawaysProductsTable < ActiveRecord::Migration[5.0]
  def change
      drop_table :Giveaways_Products
  end
end
