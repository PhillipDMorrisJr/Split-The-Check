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

Restaurant.create(name: 'Burget King',
  location: 'Macon',   
  up_vote: 3,
  down_vote: 10 )

Restaurant.create(name: 'Ryans',
  location: 'Atlanta',   
  up_vote: 9,
  down_vote: 14 )
Restaurant.create(name: 'IHop',
  location: 'Rome',   
  up_vote: 1356,
  down_vote: 2 )
Restaurant.create(name: 'Captain Ds',
  location: 'Valdosta',   
  up_vote: 19,
  down_vote: 96 )
Restaurant.create(name: 'Checkers',
  location: 'Villa Rica',   
  up_vote: 420,
  down_vote: 69 )
Restaurant.create(name: 'Cheddars',
  location: 'Columbus',   
  up_vote: 66,
  down_vote: 6)

Restaurant.create(name: 'Kellys Tavern',
  location: 'Virginia',   
  up_vote: 9001,
  down_vote: 0)
Restaurant.create(name: 'Ichiraku Ramen',
  location: 'Hidden Leaf',   
  up_vote: 64,
  down_vote: 4)

