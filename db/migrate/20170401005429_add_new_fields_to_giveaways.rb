class AddNewFieldsToGiveaways < ActiveRecord::Migration[5.0]
  def change
    add_column :giveaways, :description, :text
    add_column :giveaways, :name, :string
  end
end
