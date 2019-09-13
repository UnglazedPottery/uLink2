class Topic < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts
    has_one_attached :image
end
