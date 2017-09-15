import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKE = 'RECEIVE_POKE';
export const RECEIVE_NEW_POKE = 'RECEIVE_NEW_POKE';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receivePoke = poke => ({
  type: RECEIVE_POKE,
  poke
});

export const receiveNewPoke = poke => ({
  type: RECEIVE_NEW_POKE,
  poke
});

export const requestAllPokemon = () => dispatch => (
  APIUtil.fetchAllPokemon()
  .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const requestSinglePokemon = pokeId => dispatch => (
  APIUtil.fetchPoke(pokeId)
    .then(poke => dispatch(receivePoke(poke)))
);

export const createSinglePokemon = data => dispatch => (
  APIUtil.createPoke(data)
    .then(poke => dispatch(receiveNewPoke(poke)))
);
