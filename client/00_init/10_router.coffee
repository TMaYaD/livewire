Meteor.Router.add
  '/': ->
    Session.set 'current_page_name', 'Home'
    'page'
  '/:name': (name)->
    Session.set 'current_page_name', name
    'page'

Meteor.Router.filters
  'check_mode': (page)->
    return page unless Session.get('edit_mode')

    # Check if this is the first time
    Meteor.call 'first_user', (e, result) ->
      if e
        console.log e
        return
      else
        old_value = Session.get 'first_user'
        Session.set 'first_user', result unless result == old_value

    if Session.get('first_user')
      'register'
    else if Meteor.userId()
      'edit'
    else
      'login'

Meteor.Router.filter 'check_mode'
