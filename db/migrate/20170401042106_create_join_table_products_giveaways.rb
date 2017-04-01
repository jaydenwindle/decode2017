class CreateJoinTableProductsGiveaways < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Products, :Giveaways do |t|
      # t.index [:product_id, :giveaway_id]
      # t.index [:giveaway_id, :product_id]
    end
  end
end
