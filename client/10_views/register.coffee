Template.register.events
  'submit form': (event)->
    Accounts.createUser
      email: $('.email', event.currentTarget).val()
      password: $('.password', event.currentTarget).val()
      (error)->
        if error
          console.log error
        else
          Meteor.Router.to '/' unless error

    event.preventDefault()
