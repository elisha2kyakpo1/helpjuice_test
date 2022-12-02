50.times do
  Article.create(title: Faker::Lorem.unique.sentence, content: Faker::Lorem.paragraph_by_chars(number: 300))
end
