class School < ApplicationRecord
  has_many :recipients
  has_many :orders

  validates :name, presence: true
  validates :address, presence: true
end
