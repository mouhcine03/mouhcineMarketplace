class ApplicationController < ActionController::Base
  # Avant chaque action Devise (signup, update, etc.), autoriser les nouveaux champs
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Cette méthode autorise `name` et `phone` pendant l'inscription et la mise à jour
  def configure_permitted_parameters
    # Lors de l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
    
    # Lors de la mise à jour du compte
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
  end
end
