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



tom = Parent.create(name: "Tom", kid_count: 3, location:'nyc', email: 'tom@tom.com')
jason = Parent.create(name: "Jason", kid_count: 4, location:'co', email: 'jason@jason.com')
craig = Parent.create(name: "Craig", kid_count: 5, location:'oh', email: 'craig@craig.com')
chris = Parent.create(name: "Chris", kid_count: 6, location:'mt', email: 'chris@chris.com')

jess = Babysitter.create(name: 'Jessie', email: 'jess@jess.com')
sam = Babysitter.create(name: 'Sam', email: 'sam@sam.com')
matt = Babysitter.create(name: 'Matt', email: 'matt@matt.com')
todd = Babysitter.create(name: 'Todd', email: 'todd@todd.com')

Request.create(parent: tom, babysitter: jess)
Request.create(parent: tom, babysitter: sam)
Request.create(parent: jason, babysitter: todd)
Request.create(parent: jason, babysitter: matt)
Request.create(parent: craig, babysitter: sam)
Request.create(parent: chris, babysitter: matt)
Request.create(parent: chris, babysitter: jess)

tom_jess = ParentBabysitter.create(parent: tom, babysitter: jess)
tom_sam = ParentBabysitter.create(parent: tom, babysitter: sam)
jason_todd = ParentBabysitter.create(parent: jason, babysitter: todd)
jason_matt = ParentBabysitter.create(parent: jason, babysitter: matt)
craig_sam = ParentBabysitter.create(parent: craig, babysitter: sam)
chris_matt = ParentBabysitter.create(parent: chris, babysitter: matt)
chris_jess = ParentBabysitter.create(parent: chris, babysitter: jess)

Booking.create(parent: jason, babysitter: matt)
Booking.create(parent: craig, babysitter: sam)
Booking.create(parent: chris, babysitter: matt)
Booking.create(parent: chris, babysitter: jess)
Booking.create(parent: tom, babysitter: jess)

Review.create(parent_babysitter: tom_jess, title: "great", description: "really awesome", rating: 4)
Review.create(parent_babysitter: craig_sam, title: "Bad", description: "really not good", rating: 1)
Review.create(parent_babysitter: chris_matt, title: "Okay", description: "neutral", rating: 2)
Review.create(parent_babysitter: tom_jess, title: "better", description: "really much better", rating: 7)
Review.create(parent_babysitter: tom_sam, title: "decent", description: "dec", rating: 5)
Review.create(parent_babysitter: chris_jess, title: "nice", description: "really nice", rating: 4)
