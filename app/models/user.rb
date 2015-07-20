class User < ActiveRecord::Base
  belongs_to :message

  validates :user_name, uniqueness: true, presence: true
  validates :password, presence: true
end