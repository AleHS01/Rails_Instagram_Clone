class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximun: 100}
    validates :description, presence:true, length: {minimum: 5, maximun: 500}
    validates :keywords, presence:true, length: {minimum: 5, maximun: 100}
end
