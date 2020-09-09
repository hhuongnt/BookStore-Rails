class AddQuantityToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :quantity, :integer
  end
end
