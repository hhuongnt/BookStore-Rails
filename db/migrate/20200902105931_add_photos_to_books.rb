class AddPhotosToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :photos, :json
  end
end
