class Club < ApplicationRecord
    
    has_many :club_users
    has_many :club_books
    has_many :users, through: :club_users
    has_many :books, through: :club_books
    
    
    def current_book=(book)
        self.club_books.each do |cb|
            if cb.is_current
                cb.is_current = false
                cb.save
            elsif
                cb.book.id == book.id
                cb.is_current = true
                cb.save
            end
        end
    end

    def current_book
        current = self.club_books.detect do |cb|
            cb.is_current
        end
        if current
            current.book
        end
    end

end
