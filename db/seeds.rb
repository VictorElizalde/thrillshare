# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(email: 'vic@mail.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
user.save!

mug_gift = Gift.new(gift_type: 'MUG')
t_short_gift = Gift.new(gift_type: 'T_SHIRT')
hoodie_gift = Gift.new(gift_type: 'HOODIE')
sticker_gift = Gift.new(gift_type: 'STICKER')

mug_gift.save!
t_short_gift.save!
hoodie_gift.save!
sticker_gift.save!
