class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        followability

        has_many :post
        has_many :comments
        has_one_attached :avatar
        has_many :likes
        before_create :randomize_id

        def unfollow(user)
          followerable_relationships.where(followed_id: user.id).destroy_all
        end
        
        def self.ransackable_attributes(auth_object = nil)
          ["username"]
        end

         private
         def randomize_id
            begin
              self.id = SecureRandom.random_number(1_000_000_000)
            end while User.where(id: self.id).exists?
         end
end
