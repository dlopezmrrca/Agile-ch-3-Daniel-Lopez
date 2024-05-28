require_relative 'ar.rb'

# challenge_faker.rb

# In a loop, use Faker to generate 10 new categories.
10.times do
  # Create a new category with Faker data
  category = Category.create(
    name: Faker::Commerce.department,
    description: Faker::Lorem.sentence
  )

  # Loop to generate 10 new products for each category
  10.times do
    # Create a new product associated with the current category
    product = category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: Faker::Number.number(digits: 10)
    )

    puts "Created product '#{product.name}' associated with category '#{category.name}'."
  end
end
