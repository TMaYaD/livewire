Template.nav.pages = ->
  Pages.find
    name:
      $ne: 'Home'

Template.nav.helpers
  edit_mode: ->
    Session.get 'edit_mode'

Template.nav.events
  'submit form.new-page': (event)->
    name = event.currentTarget.getElementsByClassName('name')[0].value
    Pages.insert
      name: name
    Meteor.Router.to "/#{name}"
    event.preventDefault()

Template.page_entry.helpers
  active: ->
    'active' if Session.equals("current_page", @name)

Template.page_entry.events "click": (e)->
  Meteor.Router.to "/#{@name}"
  e.preventDefault()

