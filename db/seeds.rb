# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ParentBabysitter.destroy_all
Booking.destroy_all
Request.destroy_all
Parent.destroy_all
Babysitter.destroy_all



tom = Parent.create(name: "Tom", email: 'tom@tom.com')
jason = Parent.create(name: "Jason", email: 'jason@jason.com')
craig = Parent.create(name: "Craig", email: 'craig@craig.com')
chris = Parent.create(name: "Chris", email: 'chris@chris.com')

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

ParentBabysitter.create(parent: tom, babysitter: jess)
ParentBabysitter.create(parent: tom, babysitter: sam)
ParentBabysitter.create(parent: jason, babysitter: todd)
ParentBabysitter.create(parent: jason, babysitter: matt)
ParentBabysitter.create(parent: craig, babysitter: sam)
ParentBabysitter.create(parent: chris, babysitter: matt)
ParentBabysitter.create(parent: chris, babysitter: jess)

Booking.create(parent: jason, babysitter: matt)
Booking.create(parent: craig, babysitter: sam)
Booking.create(parent: chris, babysitter: matt)
Booking.create(parent: chris, babysitter: jess)
Booking.create(parent: tom, babysitter: jess)
