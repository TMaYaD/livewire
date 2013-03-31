Meteor.Router.add
  '/': ->
    Session.set 'current_page_name', 'Home'
    'home'
  '/:name': (name)->
    Session.set 'current_page_name', name
    'page'
  '/:name/edit': (name)->
    Session.set 'current_page_name', name
    'edit'

Deps.autorun ->
  Session.set 'current_page', Pages.findOne(name: Session.get('current_page_name'))

Deps.autorun ->
  Session.set 'current_page_id', Session.get('current_page')._id if Session.get 'current_page'
