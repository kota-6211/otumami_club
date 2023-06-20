# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(1..5).each do |n|
  User.create!(email: "user#{n}@test.com",
               password: "password",
               user_name: ( n == 1 ? "admin" : "user#{n}" ),
               last_name: "test#{n}",
               last_name_kana: "test#{n}",
               first_name: "test#{n}",
               first_name_kana: "test#{n}",
               phone_number: "0#{n}000000000",
               admin: (n == 1 ? true : false))
end

alcohole_genre_names = %w(
  ビール
  ワイン
  日本酒
  サワー
  カクテル
  焼酎
)

alcohole_genre_names.each do |name|
  AlcoholGenre.create!(name: name)
end
  