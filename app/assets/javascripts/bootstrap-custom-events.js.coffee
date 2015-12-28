$ ->
  $('.modal[autofocus]').on 'shown.bs.modal', (e) ->
    $(this).find("input[type!='hidden']:first").focus()
    
