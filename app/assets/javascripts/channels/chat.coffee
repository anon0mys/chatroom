App.chat = App.cable.subscriptions.create "ChatChannel",
  received: (data) ->
    @appendLine(data)

    appendLine: (data) ->
      html = @createLine(data)
      $("messages").append(html)

    createLine: (data) ->
      """
      <article class='chat-line'>
        <span class='chat-user'>#{data['sent_by']}</span>
        <span class='chat-body'>#{data['body']}</span>
      </article>
      """

  $('#new_message').submit (e) ->
    $this = $(this)
    textarea = $this.find('#message_body')
      App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
      textarea.val('')
