class Book < ApplicationRecord
    
    has_many :club_books
    has_many :clubs, through: :club_books
    
    scope :newest_books, -> { order(created_at: :desc).limit(5) }

end
