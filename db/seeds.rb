(1..5).each do |i|
  SchoolAdmin.create(
    name: Faker::Name.name,
    email: "admin-#{i}@example.com",
    password: "password",
  )
end

(1..5).each do |i|
  driver = Driver.create(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: "driver-#{i}@example.com",
    password: "password",
  )
  students = 10.times.map do
    Student.create(
      name: Faker::Name.name,
      street_address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zipcode: Faker::Address.zip,
    )
  end

  bus_name = "Bus #{Faker::Number.hexadecimal(3)}"

  route = Route.create(
    driver: driver,
    name: "#{bus_name}",
  )

  students.each do |student|
    Ridership.create(
      route: route,
      student: student,
      pickup_time: Time.new(0, 1, 1, Random.rand(5..6), Random.rand(0...60)),
    )
  end

  (1..10).each do |i|
    trip = Trip.create(
      start_at: Time.new(2016, 11, i, 5, 0),
      ended_at: Time.new(2016, 11, i, 7, 0),
      route: route,
    )

    route.students.each do |student|
      if Random.rand(1..10) == 1
        BoardingAction.create(
          student: student,
          trip: trip,
          boarded_at: Time.new(2016, 11, i, Random.rand(5..6), Random.rand(0...60)),
          onboard: Random.rand(1..5) == 1
        )
      end
    end
  end
end
