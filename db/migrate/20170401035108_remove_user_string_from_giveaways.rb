class RemoveUserStringFromGiveaways < ActiveRecord::Migration[5.0]
  def change
    remove_column :giveaways, :users, :string
  end
end
