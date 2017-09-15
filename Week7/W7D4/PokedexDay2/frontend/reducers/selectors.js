export const selectAllPokemon = (state) => {
  const pokeObjects = Object.values(state)[0].pokemon;
  return Object.values(pokeObjects);
};

export const selectPokemonItem = (state, itemId) => {
  return Object.values(state)[0].items.filter((item) => (
    item.id === parseInt(itemId)
  ));
};
