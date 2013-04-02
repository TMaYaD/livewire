Meteor.startup ->
  Konami ->
    Session.set 'edit_mode', !Session.get 'edit_mode'
