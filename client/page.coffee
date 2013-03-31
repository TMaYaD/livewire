Pages = new Meteor.Collection 'pages' if typeof Pages == 'undefined'

Template.page.helpers
  current_page: ->
    Session.get('current_page')
