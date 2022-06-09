class CreateBookLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :book_loans do |t|
      t.references :book, null: false, foreign_key: true
      t.string :user, null: false
      t.date :loan_date, null: false
      t.date :return_date, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
