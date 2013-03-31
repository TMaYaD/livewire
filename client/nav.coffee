Pages = new Meteor.Collection 'pages' if typeof Pages == 'undefined'

Template.nav.pages = ->
  Pages.find
    name:
      $ne: 'Home'

Template.page_entry.active = ->
  'active' if Session.equals("current_page", @name)

Template.page_entry.events "click": (e)->
  Meteor.Router.to "/#{@name}"
  e.preventDefault()

