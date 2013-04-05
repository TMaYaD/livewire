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
    $drop_pane = $(event.currentTarget)

    $drop_pane.html('Drop image here').css
      backgroundColor: '#F6F6F6'
      border: '1px dashed #666'

    filepicker.makeDropPane $drop_pane,
      mimetype: 'image/*'
      dragEnter: ->
        $drop_pane.html('Drop to upload').css
          backgroundColor: '#E0E0E0'
          border: '1px solid #000'
      dragLeave: ->
        $drop_pane.html('Drop image here').css
          backgroundColor: '#F6F6F6'
          border: '1px dashed #666'
      onSuccess: (fpFiles)->
        conversion_options =
          width: 800
          height: 350
          fit: 'crop'
          align: 'faces'
        filepicker.convert fpFiles[0],
          conversion_options
          location: 's3'
          access: 'public'
          (fpFile)->
            Pages.update Session.get('current_page_id'),
              $set:
                leader: fpFile.url
          (fpError)->
            console.log fpError
          (percentage)->
            $drop_pane.html "<div class='progress progress-warning'>Converting...<div class=bar style='width: #{percentage}%;'></div></div>"
      onError: (type, message)->
        $drop_pane.html "(#{type}) #{message}"
      onStart: (fpFiles)->
        $drop_pane.html "<div class=progress><div class=bar style='width: 0%;'></div></div>"
      onProgress: (percentage)->
        $drop_pane.html "<div class=progress>Uploading...<div class=bar style='width: #{percentage}%;'></div></div>"
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
