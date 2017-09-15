import {RECEIVE_POKE} from '../actions/pokemon_actions';
import {merge} from 'lodash';

const initialState = {
  pokeDisplay: 1,
  errors: {},
  loading: {}
};

const uiReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_POKE:
      const newState = merge({}, state);
      newState.pokeDisplay = action.poke.pokemon.id;
      return newState;
  }
};
