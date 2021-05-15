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

    # I wrote a custom scope method to query the database, chaining activerecord queries and manipulating the returned data. The first method call is to get records where "Club" overlaps my join table "Club_Books". I group by the name attribute, as this the identifying attribute I want to access. I call .count to find out how many records (ie book_ids) exist for each column. Then in order to access the highest value, I map the hash to an array and compare the values at [1] (the book count) for the maximum value.

    scope :club_with_most_books, -> { Club.joins(:club_books).group(:name).count.map { |k, v| [k, v]}.max_by { |count| count[1]} }
    

end