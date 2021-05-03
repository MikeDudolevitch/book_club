class Book < ApplicationRecord
    
    has_many :club_books
    has_many :clubs, through: :club_books


end
