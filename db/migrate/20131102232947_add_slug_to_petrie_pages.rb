class AddSlugToPetriePages < ActiveRecord::Migration
  def change
    add_column :petrie_pages, :slug, :string
  end
end
