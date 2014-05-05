# modal-styled

A module to create a modal. The purpose of this module is to have an easy to use modal that does not have any hidden dependencies (no jQuery!), and features a few useful options.

The modal comes with a default style.

## Usage
```js
var modalStyle = require('../index.js');
var theModal = modalStyle( options );
```

### Options
- title (string) a title for the modal.
- content (string or DOM object) the content of the modal.
- clickOutsideToClose (boolean) (default=true) whether a click outside the modal should close it.
- removeOnClose (boolean) (default=true) whether the modal should be removed from the DOM upon close.
- attachToBody (boolean) (default=true) whether the modal should be attached to the body upon invoke.
- buttons (array of objects) a list of buttons to add to the modal. Has a "Cancel" and "Confirm" button as defaults.
  - text (string) text of the button.
  - closeOnClick (boolean) whether a click of the button should close the modal
  - className (string) classes to add to the button
  - callback (function) a function to fire when the button is clicked

### Methods
```js
theModal.updateContent( newContent);
```
Change the content inside of the modal. Currently, this cannot change the buttons or title of the modal.

```js
theModal.deconstruct( newContent);
```
Remove the modal from the DOM.

```js
theModal.close( newContent);
```
Hide the modal.

```js
theModal.show( newContent);
```
Show the modal.

### Properties
theModal.m - the DOM object. If you set attachToBody=false, then you could instead do: div.appendChild(theModal.m);

theModal.opts - the options you passed in upon invoking the modal, plus any defaults that you did not pass in your options.

### Note
Based off of https://github.com/bengourley/modal.js


