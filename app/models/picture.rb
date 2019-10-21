class Picture < ApplicationRecord
  belongs_to :photographer
  has_many :picture_categories
  has_many :album_pictures
  has_many :categories, through: :picture_categories
  has_many :albums, through: :album_pictures
end
