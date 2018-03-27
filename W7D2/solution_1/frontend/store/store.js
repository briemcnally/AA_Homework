import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer,
    preloadedState
    // applyMiddleware(addLoggingToDispatch)
  );


  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

// const addLoggingToDispatch = store => next => action => {
//   console.log(`The old state was:`, store.getState());
//   console.log(`The action disptached was:`, action);
//   next(action);
//   console.log(`The new state is:`, store.getState());
// };

export default configureStore;
