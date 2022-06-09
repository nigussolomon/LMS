class Book < ApplicationRecord

    validates :title, :author, :isbn, :publisher, :published_date, :category, :copy, :status, presence: true
    validates :isbn, uniqueness: true
    validates :copy, numericality: { greater_than: 0,  only_integer: true }
    validates :status, inclusion: {:in => ['AVAILABLE', 'UNAVAILABLE']}
end
