Meteor.Router.add
  '/': ->
    Session.set 'current_page', 'Home'
    'home'
  '/:name': (name)->
    Session.set 'current_page', name
    'page'
  '/:name/edit': (name)->
    Session.set 'current_page', name
    'edit'

