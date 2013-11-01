class CreatePetriePages < ActiveRecord::Migration
  def change
    create_table :petrie_pages do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
