class AddItemWonToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :item_won, :string
  end
end
