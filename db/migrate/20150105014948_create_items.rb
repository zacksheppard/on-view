class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :artist_name
      t.string :object_date
      t.string :medium
      t.string :dimensions
      t.string :credit_line
      t.string :accession_number
      t.text :label
      t.string :image_url

      t.timestamps null: false
    end
  end
end
