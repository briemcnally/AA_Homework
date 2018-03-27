import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // // Phase 1
  // store.dispatch = addLoggingToDispatch(store);
  //
  // //Phase 2
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// Phase 1
// const addLoggingToDispatch = store => {
//   const sDispatch = store.dispatch;
//   return (action) => {
//     console.log(`The old state was:`, store.getState());
//     console.log(`The action disptached was:`, action);
//     sDispatch(action);
//     console.log(`The new state is:`, store.getState());
//   };
// };

// Phase 2
// const addLoggingToDispatch = store => next => action => {
//   console.log(`The old state was:`, store.getState());
//   console.log(`The action disptached was:`, action);
//   next(action);
//   console.log(`The new state is:`, store.getState());
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   Object.assign({}, store, { dispatch });
// };
