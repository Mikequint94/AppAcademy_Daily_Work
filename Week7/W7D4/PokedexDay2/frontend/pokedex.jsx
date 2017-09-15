import React from 'react';
import ReactDOM from 'react-dom';
import { HashRouter, Route } from 'react-router-dom';


import configureStore from './store/store';
import Root from './components/root';

import {fetchAllPokemon} from './util/api_util';
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';

import {selectAllPokemon} from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {

  const store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);

  // window.dispatch = store.dispatch;
  // window.getState = store.getState;
  // window.fetchAllPokemon = fetchAllPokemon;
  // window.receiveAllPokemon = receiveAllPokemon;
  // window.requestAllPokemon = requestAllPokemon;
  // window.selectAllPokemon = selectAllPokemon;
});
