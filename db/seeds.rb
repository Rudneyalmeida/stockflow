# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 10 users
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    name: Faker::Name.name,
    cpnj: Faker::Number.number(digits: 14),
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.phone_number
  )

  # Create 2 products for each user
  2.times do
    product = Product.create!(
      category: Faker::Commerce.department,
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence(word_count: 10),
      expiration: Faker::Date.forward(days: 365),
      location: Faker::Address.city
    )

    Stock.create!(
      user_id: user.id,
      product_id: product.id,
      quantity: Faker::Number.between(from: 1, to: 10)
    )
  end
end
