class Order < ApplicationRecord
  belongs_to :school
  has_and_belongs_to_many :gifts
  has_and_belongs_to_many :recipients

  validates :recipients, :presence => true
  validates :gifts, :presence => true

  validate :check_order_status, on: [:update]
  validate :check_recipients_size, on: [:create, :update]
  validate :check_gifts_for_shool_today, on: [:create, :update]

  def check_order_status
    if self.status == "ORDER_SHIPPED"
      self.errors.add(:base, "Operation not completed, the order has already been shipped.")
    end
  end

  def check_recipients_size
    if self.recipients.size > 20
      self.errors.add(:base, "Operation not completed, recipients should be 20 at most.")
    end
  end

  def check_gifts_for_shool_today
    gifts_today = 0
    self.school.orders.where(created_at: Time.now.beginning_of_day .. Time.now.end_of_day).each do |order|
      gifts_today += order.gifts.size
    end

    if gifts_today > 3
      self.errors.add(:base, "Operation not completed, gifts per day limit reached (60).")
    end
  end
end
