json.orders @orders do |order|
  json.id order.id
  json.status order.status
  json.school order.school.id
  json.recipients order.recipients
  json.gifts order.gifts
  json.created_at order.created_at
  json.updated_at order.updated_at
end
