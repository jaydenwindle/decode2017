class ChangeProductIdToString < ActiveRecord::Migration[5.0]
  def change
      remove_column :products, :prod_id, :integer
      add_column :products, :prod_id, :string
  end
end
