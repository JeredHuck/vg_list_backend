class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.integer :list_id
      t.string :list_title
      t.text :list_content

      t.timestamps
    end
  end
end
