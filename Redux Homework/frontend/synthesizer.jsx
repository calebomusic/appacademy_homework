import React from 'react';
import ReactDOM from 'react-dom';

import Note from './util/note.js';

import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  store.dispatch = addLoggingToDispatch(store);
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});

const addLoggingToDispatch = (store) => (next) => (action) => {
    const Dispatch = store.dispatch;
    console.log(action);
    console.log(action);
    let returnValue = Dispatch(action)
    console.log(store.getState());
    return returnValue;
}

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  })
  return Object.assign({}, store, { dispatch});
}
