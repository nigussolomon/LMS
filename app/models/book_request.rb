class BookRequest < ApplicationRecord

    validates :user, :title, :category, presence: true
    validates :status, presence: true, inclusion: {:in => ['ACCEPTED', 'DENIED', 'PENDING']}
end
