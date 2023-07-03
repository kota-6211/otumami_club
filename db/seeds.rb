# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
alcohol_genre_names = %w(
  ビール
  ワイン
  日本酒
  サワー
  カクテル
  焼酎
)

alcohol_genres = alcohol_genre_names.map do |name|
  AlcoholGenre.create!(name: name)
end

admin = User.create!(email: "admin@test.com",
               password: "password",
               user_name: "admin",
               last_name: "admin",
               last_name_kana: "admin",
               first_name: "admin",
               first_name_kana: "admin",
               phone_number: "00000000000",
               admin: true)

alcohol_genres.each.with_index(1) do |alcohol_genre, i|
  admin.recipes.create!(alcohol_genre_id: alcohol_genre.id, title: "test#{i}", body: "test " * 20 )
end

(1..5).each do |n|
  User.create!(email: "user#{n}@test.com",
               password: "password",
               user_name: "user#{n}",
               last_name: "user#{n}",
               last_name_kana: "user#{n}",
               first_name: "user#{n}",
               first_name_kana: "user#{n}",
               phone_number: "0#{n}000000000")
end


  