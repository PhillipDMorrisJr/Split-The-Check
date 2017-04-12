#---
# Soon to be 10 entries
#
Restaurant.delete_all
Restaurant.create(name: 'Papa Johns',
  location: 'Douglasville',   
  up_vote: 0,
  down_vote: 2)
# . . .
Restaurant.create(name: 'Waffle House',
  location: 'Stockbridge',   
  up_vote: 3,
  down_vote: 0 )
# . . .


Restaurant.create(name: 'Ryans',
  location: 'Stockbridge',   
  up_vote: 3,
  down_vote: 0 )
