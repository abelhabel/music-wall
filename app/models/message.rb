class Message < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
end