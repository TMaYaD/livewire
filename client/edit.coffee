Pages = new Meteor.Collection 'pages' if typeof Pages == 'undefined'

Template.body.helpers
  current_page: ->
    Session.get('current_page')

Template.editor.rendered = ->
  editor = ace.edit 'editor'
  editor.setTheme 'ace/theme/monokai'
  editor.getSession().setMode 'ace/mode/markdown'

  Deps.autorun ->
    page = Session.get 'current_page'
    editor.setValue page.body if page
    editor.clearSelection()

  editor.getSession().on 'change', ->
    Pages.update Session.get('current_page_id'),
      $set:
        body: editor.getValue()

