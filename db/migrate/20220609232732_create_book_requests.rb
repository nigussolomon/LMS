class CreateBookRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :book_requests do |t|
      t.string :user, null: false
      t.string :isbn,  null: false
      t.string :title,  null: false
      t.string :publisher,  null: false
      t.date :published_date,  null: false
      t.string :category,  null: false
      t.string :status,  null: false

      t.timestamps
    end
  end
end
