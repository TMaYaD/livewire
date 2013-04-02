Pages = new Meteor.Collection 'pages'

if Pages.find().count() == 0
  Pages.insert
    name: 'Home'
    leader: 'http://www.shortoftheweek.com/wp-content/uploads/2007/06/marvelous-keen-loony-bin.jpg'
    body: "Hello World\n=========\n\nThis is your first page\n  - use konami code to enter edit mode\n  - Login to get access\n  - Magic\n"

  Pages.insert
    name: 'Dillinger'
    leader: 'http://placehold.it/350x150'
    body: "Dillinger\n=========\n\nDillinger is a cloud-enabled HTML5 Markdown editor.\n\n  - Type some Markdown text in the left window\n  - See the HTML in the right\n  - Magic\n"

  Pages.insert
    name: 'Test'
    leader: 'http://placehold.it/350x150/330099/ffffff'

Meteor.methods
  first_user: ->
    Meteor.users.find().count() == 0

Accounts.validateNewUser (user)->
  Meteor.users.find().count() == 0
