require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# To load-up all rows from our Product table we call .all.

all_products = Product.all

# If we know the primary key we can search for it directly with find.

product_by_id = Product.find()

puts product_by_id.inspect

# Get the column information, create an object with all columns name
columns = Product.columns.map { |c| "#{c.name}: #{c.type}" }

# Print the columns after creating the object
puts columns

# Products with names starting with 'C' and price greater than $10
products_above_10_with_c = Product.where("name LIKE ? AND price > ?", 'C%', 10)

# Print the names of these products
products_above_10_with_c.each do |product|
  puts product.name
end; nil

# Count of products with stock quantity less than 5
low_stock_count = Product.where("stock_quantity < ?", 5).count

# Print Count of products with stock quantity less than 5
puts "Total number of products with low stock quantity: #{low_stock_count}"
