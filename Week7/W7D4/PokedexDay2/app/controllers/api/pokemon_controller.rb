class Api::PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.includes(:items).find_by(id: params[:id])
    render :show
  end

  def create
    @pokemon = Pokemon.create(pokemon_params)
    if @pokemon.save!
      render :show
    end
  end

  def pokemon_params
    params.require(pokemon).permit(:name, :attack, :defense, :poke_type, :moves, :image_url)
  end

end
