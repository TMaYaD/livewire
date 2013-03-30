Pages = new Meteor.Collection 'pages'

if Pages.find().count() == 0
  Pages.insert
    name: 'Home'
    leader: 'http://www.shortoftheweek.com/wp-content/uploads/2007/06/marvelous-keen-loony-bin.jpg'
