module ApplicationHelper
    def icon_class_for(category_name)
  case category_name
  when "Véhicules"
    "fas fa-car"
  when "Immobilier"
    "fas fa-home"
  when "Emploi"
    "fas fa-briefcase"
  when "Multimédia"
    "fas fa-mobile-alt"
  when "Maison & Jardin"
    "fas fa-couch" 
  when "Beauté"
    "fas fa-crown"
  when "Service"
    "fas fa-toolbox"
  else
    "fas fa-ellipsis-h"
  end
end

end
