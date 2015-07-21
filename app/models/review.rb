class Review < ActiveRecord::Base
  belongs_to :users
  belongs_to :messages
  validates :content, presence: true
end