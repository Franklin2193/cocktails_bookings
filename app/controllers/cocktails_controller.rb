class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show] # Saltar la autentificación en el index
  before_action :set_cocktail, only: %i[destroy show]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def destroy
    @cocktail.destroy
    redirect_to_ cocktails_path, status: :seed_other
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :price, :description, :photo)
  end

end
