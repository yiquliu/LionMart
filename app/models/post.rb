class Post < ApplicationRecord
  has_one_attached :avatar, service: :s3
end
