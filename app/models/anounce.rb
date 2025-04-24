class Anounce < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :city

  has_many_attached :images
end
