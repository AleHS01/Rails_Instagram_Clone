class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximun: 100}
    validates :description, presence:true, length: {minimum: 5, maximun: 500}
    validates :keywords, presence:true, length: {minimum: 5, maximun: 100}

    has_many_attached :images
    belongs_to :user

    before_create :randomize_id
         private
         def randomize_id
            begin
              self.id = SecureRandom.random_number(1_000_000_000)
            end while Post.where(id: self.id).exists?
         end
end
