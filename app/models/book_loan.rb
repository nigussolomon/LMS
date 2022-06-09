class BookLoan < ApplicationRecord
  belongs_to :book

  validates :book, :user, :loan_date, :return_date, presence: true
  validates :status, presence: true, inclusion: {:in => ['RETURNED', 'DUE', 'OVERDUE']}
end