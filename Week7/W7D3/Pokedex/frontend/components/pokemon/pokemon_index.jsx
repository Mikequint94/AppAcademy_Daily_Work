import React from 'react';

class PokemonIndex extends React.Component{
  constructor(){
    super();
    this.state = {};
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    const pokemonItem = this.props.pokemon.map((pokemon) => (
      <li>
        <img src={pokemon.image_url} className=""></img>
        {pokemon.name}
      </li>
    ));
    return(
      <ul>
        {pokemonItem}
      </ul>
    );
  }
}

export default PokemonIndex;
