50.times do
  Article.create(title: Faker::Movie.unique.title, content: Faker::Lorem.paragraph_by_chars(number: 300))
end
