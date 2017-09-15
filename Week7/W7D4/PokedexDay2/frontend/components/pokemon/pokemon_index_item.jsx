  import React from 'react';
  import { Link } from 'react-router-dom';

  export const PokemonIndexItem = ({pokemon}) => {
    return (
      <li>
        <Link to={'/pokemon/' + pokemon.id}>
          <img src={pokemon.image_url} className=""></img>
          {pokemon.name}
        </Link>
      </li>
    );
  };
