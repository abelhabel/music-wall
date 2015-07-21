class User < ActiveRecord::Base
  has_many :messages
  has_many :reviews
  validates :user_name, uniqueness: true, presence: true
  validates :password, presence: true
end