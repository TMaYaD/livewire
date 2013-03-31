Pages = new Meteor.Collection 'pages' if typeof Pages == 'undefined'

Template.home.current_page = ->
  Pages.findOne name: 'Home'
