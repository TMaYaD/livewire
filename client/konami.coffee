Meteor.startup ->
  Konami ->
    console.log 'konami code triggered'
    Session.set 'edit_mode', !Session.get 'edit_mode'
