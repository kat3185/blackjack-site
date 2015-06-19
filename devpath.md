Ideas for continuing development:

Actually utilize foundation.  Front end looks like crap.

Add the rest of the blackjack rules info
  splits
  double down?
  blackjacks

user login
  database to keep track of game records and possibly money

betting



refactor game data to be passed as a hash to the session, and then rebuild the game based on that hash

to hash instance method
and from hash class method that creates a new game,
based on the data in the hash


game decorator class (takes in game data)
outputs winner message
