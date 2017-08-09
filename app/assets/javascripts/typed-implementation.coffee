ready = ->
  Typed.new '.element',
    strings: [
      'Excepteur sint occaecat cupidatat non proident,'
      "sunt in culpa qui officia deserunt mollit anim id est laborum."
    ]
    typespeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready