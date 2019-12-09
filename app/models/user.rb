class User < ApplicationRecord
    has_secure_password
     validates :email, presence: true, uniqueness: true
     has_many :reviews, :dependent => :destroy
     has_many :restaurants, through: :reviews
end
