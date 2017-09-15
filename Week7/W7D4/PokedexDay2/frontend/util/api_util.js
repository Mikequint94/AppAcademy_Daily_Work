export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: 'api/pokemon'
  })
);

export const fetchPoke = (pokeId) => (
  $.ajax({
    method: 'GET',
    url: `api/pokemon/${pokeId}`
  })
);

export const createPoke = data => (
  $.ajax({
    method: 'POST',
    url: '/api/pokemon',
    data
  })
);
