require('cssify').byUrl('//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css')

var template = require('./template.jade');

var modalStyle = require('../index.js');

document.body.style.margin = '30px';
document.body.innerHTML = template();

var opts = {
  title: '',
  content: 'Put your content here.<p>Maybe even some paragraphs.</p>',
  clickOutsideToClose: true,
  removeOnClose: false
  };


var btn = document.querySelector('.launch-btn');
var modal;

btn.onclick = function(e){
  modal = modalStyle( opts );
  document.body.appendChild( modal.m );
}


var btnShow = document.querySelector('.show-btn');
btnShow.onclick = function(e){
	console.log(modal);
	if( typeof(modal) == 'undefined' || typeof(modal.m) == null || modal.m == null ){
    alert('the modal does not exist');
  } else {
    modal.show();
  }
}


var btnDestroy = document.querySelector('.destroy-btn');
btnDestroy.onclick = function(e){
	if( typeof(modal) == 'undefined' || typeof(modal.m) == null || modal.m == null ){
    alert('the modal does not exist');
  } else {
    modal.deconstruct();
  }
}


