import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util.js'


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  const store = configureStore();

  ReactDOM.render(<Root store={store}/>, root);
  window.fetchSearchGiphys = fetchSearchGiphys;

  window.store = store;


})
