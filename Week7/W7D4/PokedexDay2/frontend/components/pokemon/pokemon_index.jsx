import React from 'react';
import {PokemonIndexItem} from './pokemon_index_item';
import {Route} from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonForm from './pokemon_form';

class PokemonIndex extends React.Component{
  constructor(){
    super();
    this.state = {};
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    const pokemonItems = this.props.pokemon.map(
      (poke) => <PokemonIndexItem pokemon={poke} key={poke.id}  />
    );
    return(
      <div className="outer">
        <div className="menu">
          <ul className="pokemon-index">
            {pokemonItems}
          </ul>
        </div>
        <div className="container">
          <Route path={'/pokemon/:pokemonId'} component={PokemonDetailContainer}/>
          <Route exact path={'/pokemon/'} component={PokemonForm}/>
        </div>
      </div>
    );
  }
}

export default PokemonIndex;
