class AddDetailslToGiveaways < ActiveRecord::Migration[5.0]
  def change
    add_column :giveaways, :name, :string
    add_column :giveaways, :description, :string
  end
end
