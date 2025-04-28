# db/seeds.rb

puts "📦 Suppression de toutes les données existantes..."

# Supprimer toutes les données des tables concernées
Anounce.destroy_all if defined?(Anounce)
Category.destroy_all if defined?(Category)
City.destroy_all if defined?(City)

puts "✅ Données supprimées."

# Création de catégories
puts "📁 Création des catégories..."

categories = [
  "Véhicules",
  "Immobilier",
  "Emploi",
  "Multimédia",
  "Maison & Jardin",
  "Beauté",
  "Services",
  "Autres"
]

categories.each do |name|
  Category.create!(name: name)
end

puts "✅ Catégories créées."

# Création des villes marocaines
puts "🏙️ Création des villes marocaines..."

cities = [
  "Casablanca",
  "Rabat",
  "Fès",
  "Marrakech",
  "Tanger",
  "Agadir",
  "Meknès",
  "Oujda",
  "El Jadida",
  "Tétouan",
  "Safi",
  "Khouribga",
  "Béni Mellal",
  "Nador",
  "Taza",
  "Mohammedia",
  "Kénitra",
  "Settat",
  "Berrechid",
  "Ksar El Kebir",
  "Larache",
  "Guelmim",
  "Errachidia",
  "Ouarzazate",
  "Dakhla",
  "Laâyoune",
  "Taroudant",
  "Essaouira",
  "Al Hoceima",
  "Ifrane",
  "Azrou",
  "Taourirt",
  "Midelt",
  "Zagora"
]

cities.each do |name|
  City.create!(name: name)
end

puts "✅ Villes marocaines ajoutées avec succès."

puts "🌱 Seed terminé avec succès !"
