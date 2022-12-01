150.times do
  Article.create(title: Faker::Lorem.unique.sentence, content: Faker::Lorem.paragraph)
end
