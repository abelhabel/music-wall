class Review < ActiveRecord::Base
  belongs_to :users
  belongs_to :messages
  validates :content, presence: true
  validates :rating, numericality: { greater_than: 0, less_than: 6 }
end