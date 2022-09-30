class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show] # Saltar la autentificación en el index
  before_action :set_cocktail, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
  end


  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
