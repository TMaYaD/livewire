Template.edit.events
  'dblclick h1': (event)->
    $this = $(event.currentTarget)
    $this.replaceWith "<form class='heading input-append'><input type=text name=heading value='#{@name}'><button class=btn type=submit>Save</button></form>"
  'submit form.heading': (event)->
    $this = $('[name=heading]', event.currentTarget)
    Pages.update @_id,
      $set:
        name: $this.val()
    Meteor.Router.to "/#{$this.val()}"
    event.preventDefault()
  'dblclick .leader': (event)->
    $this = $(event.currentTarget)

    $this.html('Drop image here').css
      backgroundColor: '#F6F6F6'
      border: '1px dashed #666'

    filepicker.makeDropPane $this,
      mimetype: 'image/*'
      access: 'public'
      dragEnter: ->
        $this.html('Drop to upload').css
          backgroundColor: '#E0E0E0'
          border: '1px solid #000'
      dragLeave: ->
        $this.html('Drop image here').css
          backgroundColor: '#F6F6F6'
          border: '1px dashed #666'
      onSuccess: (fpFiles)->
        $this.html "<img src='#{fpFiles[0].url}'>"
      onError: (type, message)->
        $this.html "(#{type}) #{message}"
      onStart: (fpFiles)->
        $this.html "<div class=progress><div class=bar style='width: 0%;'></div></div>"
      onProgress: (percentage)->
        $this.html "<div class=progress><div class=bar style='width: #{percentage}%;'></div></div>"
    event.preventDefault()

Template.ace_editor.rendered = ->
  editor = ace.edit 'editor'
  editor.setTheme 'ace/theme/monokai'
  editor.getSession().setMode 'ace/mode/markdown'

  Deps.autorun ->
    page = Session.get 'current_page'
    old_body = editor.getValue()
    if page && page.body != old_body
      editor.setValue page.body
      editor.clearSelection()

  editor.getSession().on 'change', ->
    Pages.update Session.get('current_page_id'),
      $set:
        body: editor.getValue()
