
require 'faker' # pour générer de fausses données automatiquement

cities = City.all
categories = Category.all

100.times do
  Anounce.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    price: Faker::Commerce.price(range: 10..500),
    city: cities.sample,           # prend une ville existante aléatoire
    category: categories.sample,   # prend une catégorie existante aléatoire
    user_id: User.first.id          # ou adapte en fonction de ta logique d'utilisateur
  )
end

puts "✅ 10 annonces créées !"