Template.body.helpers
  current_page: ->
    Session.get('current_page')

Template.editor.rendered = ->
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

