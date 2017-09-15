import React from 'react';
import {Link, Route} from 'react-router-dom';
import ItemDetailContainer from '../items/item_detail_container';

class PokemonDetail extends React.Component{
  constructor(){
    super();
  }

  componentDidMount(){
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps){
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId){
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render(){
    let pokemon = this.props.pokemon[this.props.match.params.pokemonId];
    let items = this.props.items.map((item) => (
      <div className="items">
        <Link to={'/pokemon/' + pokemon.id + '/items/' + item.id}>
          <img src={item.image_url}></img>
          <li key={item.id}>{item.name}</li>
        </Link>
      </div>
    ));
    return(
      <ul className="pokemon-detail">
        <img src={pokemon.image_url}></img>
        <li>{pokemon.id}</li>
        <li>{pokemon.name}</li>
        <li>{pokemon.attack}</li>
        <li>{pokemon.defense}</li>
        <li>{pokemon.moves}</li>
        <li>{pokemon.poke_type}</li>
        <ul>
          {items}
          <Route path={'/pokemon/:pokemonId/items/:itemId'} component={ItemDetailContainer} />
        </ul>
      </ul>
    );
  }
}

export default PokemonDetail;
