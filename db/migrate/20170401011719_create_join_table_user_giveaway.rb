class CreateJoinTableUserGiveaway < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Users, :Giveaways do |t|
      # t.index [:user_id, :giveaway_id]
      # t.index [:giveaway_id, :user_id]
    end
  end
end
