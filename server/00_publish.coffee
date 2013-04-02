Pages = new Meteor.Collection 'pages'

Meteor.publish 'pages', ->
  Pages.find()

Pages.allow
  insert: (uid, page)->
    !!uid
  update: (uid, page)->
    !!uid
  remove: (uid, page)->
    !!uid

Meteor.methods
  first_user: ->
    Meteor.users.find().count() == 0
