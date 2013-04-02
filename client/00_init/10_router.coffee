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

Meteor.Router.filters
  'check_first_user': (page)->
    Meteor.call 'first_user', (e, result) ->
      if e
        console.log e
        return
      else
        old_value = Session.get 'first_user'
        Session.set 'first_user', result unless result == old_value
    if Session.get('first_user')
      'register'
    else
      page

Meteor.Router.filter 'check_first_user', only: 'home'
