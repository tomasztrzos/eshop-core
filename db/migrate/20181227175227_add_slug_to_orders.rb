class AddSlugToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :slug, :string, unique: true
  end
end
