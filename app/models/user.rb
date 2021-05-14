class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :club_users
    has_many :clubs, through: :club_users

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.email
          user.email = auth.info.email
          user.password = SecureRandom.hex(15)
        end
      end
    
    def is_admin?(club)
        if self.clubs.include?(club)
            self.admin = true
        else
            false
        end
    end

    def is_a_member(club)
        member = self.club_users.detect do |cu|
            cu.club == club
        end
    end

end