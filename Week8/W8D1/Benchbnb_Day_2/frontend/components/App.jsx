import React from 'react';
import GreetingContainer from './greeting_container';
import SessionFormContainer from './session_form_container';
import {Route} from 'react-router-dom';
import {AuthRoute} from '../util/route_util';

import SearchContainer from './search_container';


const App = () => (
  <div>
    <header>
      <a href = "/">
        <h1 id="gohome">Bench BnB</h1>
      </a>
      <GreetingContainer />
    </header>
    <AuthRoute path="/login" component={SessionFormContainer}/>
    <AuthRoute path="/signup" component={SessionFormContainer}/>
    <Route exact path="/" component = {SearchContainer}/>
  </div>
);

export default App;
