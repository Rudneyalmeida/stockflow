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
