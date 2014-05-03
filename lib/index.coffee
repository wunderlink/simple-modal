
require './style.css'


module.exports = (opts={}) ->
  modal = new ModalStyle(opts)
  return modal

template = require './modal.jade'


class ModalStyle
  constructor: (o) ->
    @m = {}
    @opts =
      title: 'Wait!'
      content: 'What would you like to do?'
      buttons: [
        text: 'Cancel'
        closeOnClick: true
      ,
        text: 'Confirm'
        className: 'btn-primary'
        closeOnClick: true
      ]
      clickOutsideToClose: true
      removeOnClose: true
      attachToBody: true

    buttonDefaults =
      closeOnClick: true

    for opt, val of o
      @opts[opt] = val
      if opt == 'buttons'
        for button in val
          for prop, v of buttonDefaults
            if !button[prop]?
              button[prop] = v

    @build()
  
  
  build: ->
    self = this

    @m = document.createElement 'div'
    @m.className = 'modal-styled-holder'
    @m.innerHTML = template(@opts)

    @updateContent @opts.content
  
    controls = @m.querySelectorAll '.modal-styled-controls>button'
    for b, i in controls
      if @opts.buttons[i]?
        item = @opts.buttons[i]
        b.setAttribute 'data-index', i
        if item.callback?
          b.onclick = (e) ->
            index = e.target.getAttribute 'data-index'
            bdata = self.opts.buttons[index]
            bdata.callback(e)
            if bdata.closeOnClick
              self.close()
        else
          b.onclick = (e) ->
            index = e.target.getAttribute 'data-index'
            bdata = self.opts.buttons[index]
            if bdata.closeOnClick
              self.close()
  
    if @opts.clickOutsideToClose
      bg = @m.querySelector '.modal-styled-overlay'
      bg.onclick = ->
        self.close()

    if @opts.attachToBody
      document.body.appendChild @m

    @show()

  updateContent: (new_content) ->
    c = @m.querySelector '.modal-styled-content'
    if typeof new_content == 'string'
      c.innerHTML = new_content
    else
      c.appendChild new_content

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
