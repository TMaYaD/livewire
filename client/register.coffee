Template.register.events
  'submit form': (event)->
    Accounts.createUser
      email: event.currentTarget.getElementsByClassName('email')[0].value
      password: event.currentTarget.getElementsByClassName('password')[0].value
      (error)->
        if error
          console.log error
        else
          Meteor.Router.to '/' unless error

    event.preventDefault()
