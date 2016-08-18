# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ParentBabysitter.destroy_all
Review.destroy_all
Request.destroy_all
BookingRequest.destroy_all
Booking.destroy_all
Parent.destroy_all
Babysitter.destroy_all
User.destroy_all


user_tom = User.create(username: 'tom', name: 'Tom', email: 'tom@tom.com', password: 'tom')
user_craig = User.create(username: 'craig', name: 'Craig', email: 'craig@craig.com', password: 'craig')
user_chris = User.create(username: 'chris', name: 'Chris', email: 'chris@chris.com', password: 'chris')
user_dan = User.create(username: 'dan', name: 'Dan', email: 'dan@dan.com', password: 'dan')


tom = Parent.create(user: user_tom, kid_count: 5, specific_needs: 'bring food', extra_requests: 'bring lots of food')
craig = Parent.create(user: user_craig, kid_count: 2, specific_needs: 'bring movies', extra_requests: 'be happy')
chris = Parent.create(user: user_chris, kid_count: 3, specific_needs: 'bring TV', extra_requests: 'dont be sad')
dan = Parent.create(user: user_dan, kid_count: 4, specific_needs: 'bring drinks', extra_requests: 'be chill')


user_jess = User.create(username: 'jessie', name: 'Jessie', email: 'jessie@jessie.com', password: 'jessie')
user_sam = User.create(username: 'sam', name: 'Sam', email: 'sam@sam.com', password: 'sam')
user_matt = User.create(username: 'matt', name: 'Matt', email: 'matt@matt.com', password: 'matt')
user_todd = User.create(username: 'todd', name: 'Todd', email: 'todd@todd.com', password: 'todd')


jess = Babysitter.create(user: user_jess, age: 19, location: 'nyc', bio: 'computer programminger', skills: 'good with kids')
sam = Babysitter.create(user: user_sam, age: 32, location: 'boston', bio: 'like movies', skills: 'great with kids')
matt = Babysitter.create(user: user_matt, age: 20, location: 'nyc', bio: 'like TV', skills: 'okay with kids')
todd = Babysitter.create(user: user_todd, age: 16, location: 'oberlin', bio: 'chill a lot', skills: 'bads with kids')


Request.create(parent: tom, babysitter: jess)
Request.create(parent: tom, babysitter: sam)
Request.create(parent: dan, babysitter: todd)
Request.create(parent: dan, babysitter: matt)
Request.create(parent: craig, babysitter: sam)
Request.create(parent: chris, babysitter: matt)
Request.create(parent: chris, babysitter: jess)
Request.create(parent: dan, babysitter: jess)

tom_jess = ParentBabysitter.create(parent: tom, babysitter: jess)
tom_sam = ParentBabysitter.create(parent: tom, babysitter: sam)
dan_todd = ParentBabysitter.create(parent: dan, babysitter: todd)
dan_matt = ParentBabysitter.create(parent: dan, babysitter: matt)
craig_sam = ParentBabysitter.create(parent: craig, babysitter: sam)
chris_matt = ParentBabysitter.create(parent: chris, babysitter: matt)
chris_jess = ParentBabysitter.create(parent: chris, babysitter: jess)
todd_dan = ParentBabysitter.create(parent: dan, babysitter: todd)

Booking.create(parent: dan, babysitter: matt)
Booking.create(parent: craig, babysitter: sam)
Booking.create(parent: chris, babysitter: matt)
Booking.create(parent: chris, babysitter: jess)
Booking.create(parent: tom, babysitter: jess)

# Review.create(parent_babysitter: tom_jess, title: "great", description: "really awesome", rating: 4)
# Review.create(parent_babysitter: craig_sam, title: "Bad", description: "really not good", rating: 1)
# Review.create(parent_babysitter: chris_matt, title: "Okay", description: "neutral", rating: 2)
# Review.create(parent_babysitter: tom_jess, title: "better", description: "really much better", rating: 7)
# Review.create(parent_babysitter: tom_sam, title: "decent", description: "dec", rating: 5)
# Review.create(parent_babysitter: chris_jess, title: "nice", description: "really nice", rating: 4)
