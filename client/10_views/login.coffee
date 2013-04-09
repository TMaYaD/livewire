Template.login.events
  'submit form': (event)->
    email = $('[name=email]', event.currentTarget).val()
    password = $('[name=password]', event.currentTarget).val()
    Meteor.loginWithPassword email, password,
      (error)->
        console.log error if error

    event.preventDefault()
