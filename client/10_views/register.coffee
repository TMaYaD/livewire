Template.register.events
  'submit form': (event)->
    Accounts.createUser
      email: $('[name=email]', event.currentTarget).val()
      password: $('[name=password]', event.currentTarget).val()
      profile:
        filepicker_key: $('[name=filepicker]', event.currentTarget).val()
      (error)->
        console.log error if error

    event.preventDefault()
