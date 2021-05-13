class ClubBook < ApplicationRecord


    belongs_to :book
    belongs_to :club
    # validates :book_id, presence: true

end
