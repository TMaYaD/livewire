Template.register.events
  'submit form': (event)->
    Accounts.createUser
      email: $('[name=email]', event.currentTarget).val()
      password: $('[name=password]', event.currentTarget).val()
      profile:
        filepicker_key: $('[name=filepicker]', event.currentTarget).val()
      (error)->
        if error
          console.log error
        else
          Meteor.Router.to '/' unless error

    event.preventDefault()
