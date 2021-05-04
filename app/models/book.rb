class Book < ApplicationRecord
    
    has_many :club_books
    has_many :clubs, through: :club_books
    def self.newest_books
        Book.order(created_at: :desc).limit(5)
    end


end
