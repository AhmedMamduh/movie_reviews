class CreateMovieDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_details do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :actor
      t.string :location
      t.string :country

      t.timestamps
    end
  end
end
