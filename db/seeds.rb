# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
posts = [{:title => 'Textbook1',
          :description=>"Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions",
          :post_by => "Yiqu Liu",
          :price => 1122},
         {:title => 'Textbook2',
          :description=>"Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions Some descriptions",
          :post_by => "Jing Dong",
          :price => 3.9}
]

users = [{:google_id => 'yl4617',
          :user_name => "Yiqu Liu",
          :email => 'yl4617@columbia.edu'},
         {:google_id => 'jd3768',
          :user_name => "Jing Dong",
          :email => 'jd3768@columbia.edu'}
]

posts.each do |post|
  Post.create!(post)
end

users.each do |user|
  User.create!(user)
end