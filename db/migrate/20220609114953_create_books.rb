class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
      t.string :publisher, null: false
      t.date :published_date, null: false
      t.string :category, null: false
      t.text :description
      t.integer :copy, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
