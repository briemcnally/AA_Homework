import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './actions/giphy_actions';
import { receiveSearchGiphys } from './actions/giphy_actions';

document.addEventListener("DOMContentLoaded", () => {
  window.store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={window.store} />, root);
});
