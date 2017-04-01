class AddGiveawayToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :giveaway, foreign_key: true
  end
end
