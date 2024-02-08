class RemoveUnusedFieldsFromMovie < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :actor
    remove_column :movies, :location
    remove_column :movies, :country
  end
end
