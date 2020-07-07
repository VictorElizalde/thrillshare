class CreateOrdersRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_recipients do |t|
      t.belongs_to :order
      t.belongs_to :recipient
    end
  end
end
