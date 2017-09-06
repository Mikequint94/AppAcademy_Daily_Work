const View = require('./snake-view.js');

$( () => {
  let board =  $('.snake');
  new View(board);
});
