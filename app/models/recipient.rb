class Recipient < ApplicationRecord
  belongs_to :school
  has_and_belongs_to_many :orders

  validates :name, presence: true
  validates :address, presence: true
end
