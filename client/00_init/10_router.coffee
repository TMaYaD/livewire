Meteor.Router.add
  '/': ->
    Session.set 'current_page_name', 'Home'
    'page'
  '/:name': (name)->
    Session.set 'current_page_name', name
    'page'

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
  'check_edit_mode': (page)->
    if Session.get('edit_mode')
      'edit'
    else
      page

Meteor.Router.filter 'check_first_user', only: 'edit'
Meteor.Router.filter 'check_edit_mode', only: ['page', 'home']
