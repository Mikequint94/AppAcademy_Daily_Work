import {RECEIVE_ALL_POKEMON, RECEIVE_POKE, RECEIVE_NEW_POKE} from '../actions/pokemon_actions';
import {merge} from 'lodash';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;
  let id;
  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      newState = merge({}, state);
      newState = action.pokemon;
      return newState;
    case RECEIVE_POKE:
      newState = merge({}, state);
      id = action.poke.pokemon.id;
      newState[id] = action.poke.pokemon;
      return newState;
    case RECEIVE_NEW_POKE:
      newState = merge({}, state);
      id = action.poke.pokemon.id;
      newState[id] = action.poke.pokemon;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
