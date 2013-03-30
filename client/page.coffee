Pages = new Meteor.Collection 'pages'

Template.nav.pages = ->
  Pages.find()

Template.page_entry.active = ->
  'active' if Session.equals("current_page", this._id)

Template.page_entry.events "click": (e)->
  Session.set 'current_page', this._id
  e.preventDefault()

Template.page.current_page = ->
  Pages.findOne Session.get('current_page') if Session.get('current_page')
