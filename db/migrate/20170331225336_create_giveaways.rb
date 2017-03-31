class CreateGiveaways < ActiveRecord::Migration[5.0]
  def change
    create_table :giveaways do |t|
      t.Integer :store
      t.Text :users
      t.Text :products

      t.timestamps
    end
  end
end
