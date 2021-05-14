class Club < ApplicationRecord
    
    has_many :club_users
    has_many :club_books
    has_many :users, through: :club_users
    has_many :books, through: :club_books
    validates :name, presence: true
    validates :meeting_day, presence: true
    validates :zoom_link, presence: true
    
    def admin
        self.club_users.detect { |cu| cu.admin }.user
    end

    scope :club_with_most_books, -> { order(club_books: :desc).count.limit(1) }

end
