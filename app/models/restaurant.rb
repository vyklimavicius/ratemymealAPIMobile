class Restaurant < ApplicationRecord
    has_one_attached :image
    has_many :reviews
    has_many :users, through: :reviews
    has_many :ratings, through: :reviews 
end
