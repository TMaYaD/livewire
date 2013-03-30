Pages = new Meteor.Collection 'pages' if typeof Pages == 'undefined'

Template.nav.pages = ->
  Pages.find()

Template.page_entry.active = ->
  'active' if Session.equals("current_page", this._id)

Template.page_entry.events "click": (e)->
  Session.set 'current_page', this._id
  e.preventDefault()

