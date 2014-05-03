
require('./style.css');
var template = require('./template.jade');

var modalStyle = require('../index.js');

document.body.innerHTML = template();


var actionResult = document.querySelector('.actionResult');

var btn = document.querySelector('.launch-d-btn');
var modal;

btn.onclick = function(e){
  actionResult.innerHTML = '';
  var opts = {
    title: 'Deconstruct-a-Modal',
    content: 'This modal will be deconstructed upon close',
    clickOutsideToClose: true,
    removeOnClose: true
    };
  modal = modalStyle( opts );
}




var btn = document.querySelector('.launch-h-btn');
btn.onclick = function(e){
  actionResult.innerHTML = '';
  var opts = {
    title: 'Hide-a-Modal',
    content: 'This modal will be hidden upon close',
    clickOutsideToClose: true,
    removeOnClose: false
    };
  modal = modalStyle( opts );
}


var btn = document.querySelector('.launch-q-btn');
btn.onclick = function(e){
  actionResult.innerHTML = '';
  var opts = {
    title: 'Try A Callback',
    content: 'This passes a callback on the button so that we may fooify the green box',
    buttons: [
      {
      text: 'Do The Foo',
      callback: function() {
        actionResult.innerHTML = 'foo';
        }
      }
    ],
    clickOutsideToClose: true,
    removeOnClose: false
    };
  modal = modalStyle( opts );
}


var btn = document.querySelector('.launch-n-btn');
btn.onclick = function(e){
  actionResult.innerHTML = '';
  var opts = {
    title: 'Multipage Modal',
    content: 'First page',
    buttons: [
      {
      text: 'Cancel',
      },
      {
      text: 'Next',
      closeOnClick: false,
      callback: function() {
        new_modal = modalStyle();
        }
      }
    ],
    clickOutsideToClose: true,
    removeOnClose: false
    };
  modal = modalStyle( opts );
}


var btnShow = document.querySelector('.show-btn');
btnShow.onclick = function(e){
	console.log(modal);
  actionResult.innerHTML = '';
	if( typeof(modal) == 'undefined' || typeof(modal.m) == null || modal.m == null ){
    actionResult.innerHTML = 'the modal does not exist';
  } else {
    modal.show();
  }
}


var btnDeconstruct = document.querySelector('.destroy-btn');
btnDeconstruct.onclick = function(e){
  actionResult.innerHTML = '';
	if( typeof(modal) == 'undefined' || typeof(modal.m) == null || modal.m == null ){
    actionResult.innerHTML = 'the modal does not exist';
  } else {
    modal.deconstruct();
  }
}



