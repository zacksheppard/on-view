class AddItemUrlToItem < ActiveRecord::Migration
  def change
    add_column :items, :url, :string
  end
end
