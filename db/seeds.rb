ParentBabysitter.destroy_all
Review.destroy_all
Request.destroy_all
BookingRequest.destroy_all
Booking.destroy_all
Parent.destroy_all
Babysitter.destroy_all
User.destroy_all

# Create users who are parents
150.times do
  name = Faker::Name.name
  username = name.downcase.delete(' ')
  user = FactoryGirl.create(:user,
    name: name,
    username: username,
    email: "#{username}@example.com",
    password: "password"
  )
  FactoryGirl.create(:parent,
    user_id: user.id,
    address: Faker::Address.street_address,
    kid_count: Random.rand(1..6),
    specific_needs: Faker::Lorem.sentence(3),
    extra_requests: Faker::Lorem.sentence(3)
  )
end

# Create users who are babysitters
50.times do
  name = Faker::Name.name
  username = name.downcase.delete(' ')
  user = FactoryGirl.create(:user,
    name: name,
    username: username,
    email: "#{username}@example.com",
    password: "password"
  )
  FactoryGirl.create(:babysitter,
    user_id: user.id,
    age: Random.rand(18..100),
    location: Faker::Address.street_name,
    bio: Faker::Lorem.sentence(3),
    skills: Faker::Lorem.sentence(3)
  )
end

# Randomly create requests between babysitters and parents
Parent.all.each do |parent|
  Babysitter.all.each do |babysitter|
    if Random.rand(0..10) > 6
      FactoryGirl.create(:request,
        parent_id: parent.id,
        babysitter_id: babysitter.id
      )
    end
  end
end

# Randomly accept a certain number of those, so that the relationships are created
Request.all.each do |request|
  # go through all requests and randomly accept a subset of them
  if Random.rand(0..10) > 4
    Request.accept(request.id)
  end
end

# Randomly create booking_requests
Parent.all.each do |parent|
  parent.babysitters.each do |babysitter|
    # randomly create booking requests
    if Random.rand(0..10) > 3
      FactoryGirl.create(:booking_request,
        parent_id: parent.id,
        babysitter_id: babysitter.id,
        duration: 60
        
      )
    end
  end
end

# Randomly accept booking_requests
BookingRequest.all.each do |b_request|
  # go through all booking_request and randomly accept a subset of them
  if Random.rand(0..10) > 4
    BookingRequest.accept(b_request.id)
  end
end

# Randomly create reviews
Parent.all.each do |parent|
  parent.babysitters.each do |babysitter|
    # randomly create reviews
    if Random.rand(0..10) > 3
      FactoryGirl.create(:review,
        parent_id: parent.id,
        babysitter_id: babysitter.id,
        title: "#{Faker::Lorem.word}!",
        description: Faker::Lorem.sentence,
        rating: Random.rand(0..5)
      )
    end
  end
end
