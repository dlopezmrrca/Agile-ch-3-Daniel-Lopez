require_relative 'ar.rb'

for i in 1..10
 # In a loop user Faker to generate 10 new categories.
  category = Category.create(
    name: Faker::Commerce.department,
    description: Faker::Lorem.sentence
  )


  for j in 1..10
    # Within this same loop use the newly created and saved category objects to generate 10 new products for each category. The name, description, price and quantity of these 10 products should also be generated using faker.
    product = category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: Faker::Number.number(2)
    )
    puts "Created product '#{product.name}' associated with category '#{category.name}'."
  end
end
