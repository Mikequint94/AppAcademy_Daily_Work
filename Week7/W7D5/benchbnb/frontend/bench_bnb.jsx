import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

import { signup, login, logout} from './actions/session_actions';


document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    const preloadedState = {session: { currentUser: window.currentUser}};

  store = configureStore(preloadedState);

  delete window.current_user;
} else {
  store = configureStore();
}

  const entryPoint = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, entryPoint);

  // Debugging!
  window.getState = store.getState;
  window.dispatch = store.dispatch; // just for testing!
  window.signup = signup;
  window.login = login;
  window.logout = logout;
});
