loadFilepicker (something)->
  Deps.autorun ->
    filepicker.setKey Meteor.user().profile.filepicker_key if Meteor.user()
