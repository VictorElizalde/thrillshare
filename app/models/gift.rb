class Gift < ApplicationRecord
  has_and_belongs_to_many :orders

  validates :gift_type, presence: true
end
