worker = ->
  $.ajax
    method: "post"
    url: "get_messages"
    success: (data) ->
      append message for message in data

    complete: ->
      setTimeout worker, 500

append = (message) ->
  timetoken = parseInt($("#timetoken").html())
  msg = jQuery("<div/>",
    text: message.message
    class: 'list-group-item'
  )

  author = jQuery("<span/>",
    text: message.author
    class: 'badge'
  )

  author.appendTo msg
  msg.appendTo "#messages"

  $("#messages").stop().animate
    scrollTop: $("#messages")[0].scrollHeight, 800

  $("#message-field").val('')

$ ->
  $('#send-button').click ->
    $.ajax
      method: "post"
      url: "publish"
      data: {
        author: $("#author-field").val()
        message: $("#message-field").val()
      }

$ -> worker()
