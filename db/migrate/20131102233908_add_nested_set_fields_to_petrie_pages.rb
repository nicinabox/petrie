class AddNestedSetFieldsToPetriePages < ActiveRecord::Migration
  def change
    add_column :petrie_pages, :lft, :integer
    add_column :petrie_pages, :rgt, :integer
    add_column :petrie_pages, :parent_id, :integer
    add_column :petrie_pages, :depth, :integer
  end
end
