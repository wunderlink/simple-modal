
require './style.css'


module.exports = (opts={}) ->
  modal = new ModalStyle(opts)
  return modal

template = require './modal.jade'


class ModalStyle
  m: {}
  opts:
    title: 'Wait!'
    content: 'What would you like to do?'
    buttons: [
      text: 'Cancel'
      className: ''
      keyCodes: [27]
    ,
      text: 'Confirm'
      className: 'btn-primary'
    ]
    clickOutsideToClose: true
    removeOnClose: true
    attachToBody: true
  
  constructor: (o) ->
    self = this

    for opt, val of o
      @opts[opt] = val
  
    @m = document.createElement 'div'
    @m.className = 'modal-styled-holder'
    @m.innerHTML = template(@opts)

    c = @m.querySelector '.ms-content'
    if typeof @opts.content == 'string'
      c.innerHTML = @opts.content
    else
      c.appendChild @opts.content
  
    controls = @m.querySelectorAll '.ms-controls>button'
    for b, i in controls
      if @opts.buttons[i]?
        item = @opts.buttons[i]
        if item.callback?
          b.onclick = (e) ->
            item.callback(e)
            self.close()
        else
          b.onclick = (e) ->
            self.close()
  
    if @opts.clickOutsideToClose
      bg = @m.querySelector '.ms-overlay'
      bg.onclick = ->
        self.close()

    if @opts.attachToBody
      document.body.appendChild @m

    @show()

  deconstruct: ->
    @m.parentNode.removeChild @m
    @m = null

  close: ->
    if @opts.removeOnClose
      @deconstruct()
    else
      @m.style.display = 'none'

  show: ->
    @m.style.display = 'block'
