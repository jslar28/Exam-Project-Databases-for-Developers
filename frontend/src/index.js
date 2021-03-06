import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import 'bootstrap/dist/css/bootstrap.css';
import * as serviceWorker from './serviceWorker';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import MainPage from './components/MainPage';
import AdminPage from './components/AdminPage';
import LoginPage from './components/LoginPage';

const Root = () => {
  return (
    <div className="container">
      <Switch>
        <Route exact path="/main" component={MainPage} />
        <Route exact path="/admin" component={AdminPage} />
        <Route exact path="/" component={LoginPage} />
      </Switch>
    </div>
  );
};

ReactDOM.render(
  <BrowserRouter>
    <Root />
  </BrowserRouter>,
  document.getElementById('root')
)

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
