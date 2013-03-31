Pages = new Meteor.Collection 'pages' if typeof Pages == 'undefined'

Template.page.current_page = ->
  Pages.findOne name: Session.get('current_page') if Session.get('current_page')
