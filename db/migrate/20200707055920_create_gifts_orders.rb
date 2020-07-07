class CreateGiftsOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts_orders do |t|
      t.belongs_to :gift
      t.belongs_to :order
    end
  end
end
