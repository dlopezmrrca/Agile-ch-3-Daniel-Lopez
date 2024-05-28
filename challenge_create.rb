require_relative 'ar.rb'

# Method One:

# Create a new Product in "object space"
new_product = Product.new

# Set the required properties
new_product.name = "Tortrix"
new_product.description = "This is Tortrix Description."
new_product.price = 12.99
new_product.stock_quantity = 100

# Calling save on the object will persist it to the products table.
new_product.save

# We can call inspect on any object to inspect its internals.
puts new_product.inspect


# Method Two:
# Create a Product in "object space"

# This time we set the required properties as key/value arguments of the new method.

new_product2 = Product.new( name:  "Incaparina",
                      price: 15.25,
                      description:  "Incaparina Description",
                      stock_quantity: 5)

# Like the previous example we need to call save to persist the object
# to the customers table.

new_product2.save

# We can call inspect on any object to inspect its internals.
puts new_product2.inspect

# Method Three:
#Create the object and persist it all at once.

new_product3 = Product.new( name:  "Tamal",
                      price: 4.55,
                      description:  "Tamal Description",
                      stock_quantity: 20)

#4

#Create a Product object that is missing some required columns.

missing_1 = Product.new( name:  "Fiambre")

if missing_1.save
  puts "Product was saved successfully."
  puts missing_1.inspect
else
  puts "There was an error saving the product. Please Check =====>>>"

  # Loop through all the validation errors and print them
  missing_1.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}."
    end
  end
end
