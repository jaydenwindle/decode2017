class CreateGiveaways < ActiveRecord::Migration[5.0]
  def change
    create_table :giveaways do |t|
      t.integer :store
      t.text :users
      t.text :products

      t.timestamps
    end
  end
end
