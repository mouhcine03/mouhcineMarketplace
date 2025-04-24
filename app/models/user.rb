class User < ApplicationRecord
  has_many :anounces
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true

  # Validation pour le téléphone
  validates :phone, presence: true,
                    format: { with: /\A\d{10}\z/, message: "doit contenir exactement 10 chiffres" }

end
