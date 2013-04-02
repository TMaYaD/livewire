Accounts.validateNewUser (user)->
  Meteor.users.find().count() == 0
