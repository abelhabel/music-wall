class Message < ActiveRecord::Base
  belongs_to :users
  validates :title, presence: true
  validates :author, presence: true
  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
end