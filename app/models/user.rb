class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :club_users
    has_many :clubs, through: :club_users

    def is_admin?(club)
        if self.clubs.include?(club)
            true
        else
            false
        end
    end

    def is_a_member(club)
        member = self.club_users.detect do |cu|
            cu.club == club
        end
        if member
            member.admin
        end
    end

end