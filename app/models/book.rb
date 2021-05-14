class Book < ApplicationRecord
    
    has_many :club_books
    has_many :clubs, through: :club_books
    validates :name, presence: true
    validates :author, presence: true
    
    scope :newest_books, -> { order(created_at: :desc).limit(5) }

end
