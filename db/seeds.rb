# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |i|
  Item.create!(name: "商品#{i}",baika: (100*i)+20, genka: (50*i)+10, jan:"12000#{i}" ,stock:20)
end   
User.create!(name: "管理者A", email: "admin@example.com", password:"password", password_confirmation: "password")
User.create!(name: "管理者B", email: "admin2@example.com", password:"password", password_confirmation: "password")