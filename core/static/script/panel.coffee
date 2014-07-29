$ ->
  $('#service-switch button').click ->
    is_enable = if $(@).hasClass 'btn-success' then true else false
    $.post "/plugin/#{$(@).data('name')}/switch/", JSON.stringify
      enable: is_enable
    .fail (jqXHR) ->
      if jqXHR.responseJSON?.error
        alert jqXHR.responseJSON.error
      else
        alert jqXHR.statusText
    .success ->
      location.reload()

  $('.plan-list .btn-danger').click ->
    if window.confirm 'Are you sure?'
      $.post "/plan/unsubscribe/", JSON.stringify
        plan: $(@).parents('tr').data 'name'
      .fail (jqXHR) ->
        if jqXHR.responseJSON?.error
          alert jqXHR.responseJSON.error
        else
          alert jqXHR.statusText
      .success ->
        location.reload()

  $('.plan-list .btn-success').click ->
    $.post "/plan/subscribe/", JSON.stringify
      plan: $(@).parents('tr').data 'name'
    .fail (jqXHR) ->
      if jqXHR.responseJSON?.error
        alert jqXHR.responseJSON.error
      else
        alert jqXHR.statusText
    .success ->
      location.reload()