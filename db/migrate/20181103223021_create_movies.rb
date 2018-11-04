class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :y_id
      t.string :title
      t.string :summary
      t.string :trailer_url

      t.timestamps
    end
  end
end
