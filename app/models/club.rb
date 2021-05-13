class Club < ApplicationRecord
    
    has_many :club_users
    has_many :club_books
    has_many :users, through: :club_users
    has_many :books, through: :club_books
    
    def admin
        self.club_users.detect { |cu| cu.admin }.user
    end

end
