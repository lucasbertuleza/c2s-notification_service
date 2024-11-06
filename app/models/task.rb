class Task < ApplicationRecord
  has_many :notifications, dependent: :restrict_with_exception

  validates :uuid, presence: true
  validates :user, presence: true
  validates :url, presence: true
end
