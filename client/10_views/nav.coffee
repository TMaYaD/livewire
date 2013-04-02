Template.nav.pages = ->
  Pages.find
    name:
      $ne: 'Home'

Template.nav.helpers
  edit_mode: ->
    Session.get 'edit_mode'

Template.nav.events
  'submit form.new-page': (event)->
    $name = $('.name', event.currentTarget)
    name = $name.val()
    Pages.insert
      name: name
    Meteor.Router.to "/#{name}"
    $name.val ''
    event.preventDefault()

Template.page_entry.helpers
  active: ->
    'active' if Session.equals("current_page", @name)
  edit_mode: ->
    Session.get 'edit_mode'

Template.page_entry.events
  'click a.page': (e)->
    Meteor.Router.to "/#{@name}"
    e.preventDefault()
  'click a.remove': (e)->
    Pages.remove @_id
    e.preventDefault()

