class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index # Saltar la autentificación en el index
end
