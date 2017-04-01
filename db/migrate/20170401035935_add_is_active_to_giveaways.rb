class AddIsActiveToGiveaways < ActiveRecord::Migration[5.0]
  def change
    add_column :giveaways, :isActive, :boolean
  end
end
