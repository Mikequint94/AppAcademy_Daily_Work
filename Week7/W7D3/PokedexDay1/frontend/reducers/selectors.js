// import {values} from 'lodash';

export const selectAllPokemon = (state) => {
  const pokeObjects = Object.values(state)[0].pokemon;
  return Object.values(pokeObjects);
};
