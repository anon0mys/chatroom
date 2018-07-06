App.chat = App.cable.subscriptions.create "ChatChannel",
  received: (data) ->
    @appendLine(data)

    appendLine: (data) ->
      html = @createLine(data)
      $("[data-chat-room='chat_channel']").append(html)

    createLine: (data) ->
      """
      <article class='chat-line'>
        <span class='chat-user'>#{data['sent_by']}</span>
        <span class='chat-body'>#{data['body']}</span>
      </article>
      """
