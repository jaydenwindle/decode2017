class DropGiveawaysUsersTable < ActiveRecord::Migration[5.0]
  def change
      drop_table :Giveaways_Users
  end
end
