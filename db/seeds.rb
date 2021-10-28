# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts = [{:title => 'Textbook1',
          :description=>"Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions",
          :post_by => "somebody",
          :price => 1122},
         {:title => 'Textbook2',
          :description=>"Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions",
          :post_by => "somebody",
          :price => 3.9}
]

posts.each do |post|
  Post.create!(post)
end