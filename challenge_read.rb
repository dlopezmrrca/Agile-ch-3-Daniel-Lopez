require_relative 'ar.rb'

#1
#Product Count
number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

#2
# To load-up all rows from our Product table we call .all.

all_products = Product.all

#3
# If we know the primary key we can search for it directly with find.

product_by_id = Product.find(177)

puts product_by_id.inspect

#4
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

#5
# Count of products with stock quantity less than 5
low_stock_count = Product.where("stock_quantity < ?", 5).count

# Print Count of products with stock quantity less than 5
puts "Total number of products with low stock quantity: #{low_stock_count}"

#6
# Find the name of the category associated with one of the products you have found. (You should do this without referencing the products foreign key value. Use the product's "belongs to" association instead.)
product = Product.find_by(name: "Chai")
category_name = product.category.name if product.category
puts "Category associated with the product: #{category_name}"

#7
# Find a specific category and use it to build and persist a new product associated with this category. (You should do this without manually setting the products foreign key. Look at the end of this example file to see how to build an ActiveRecord object by way of an "has many" association.)

#create an object with the category

beverages = Category.where(:name => 'Beverages').first

#create the new product

new_product_no_cat = Product.new( name:  "Tortillas2",
                      price: 4.55,
                      description:  "Tortillas2 Description",
                      stock_quantity: 20)

#use the assign category object to assign the category

new_product_no_cat.category = beverages

new_product_no_cat.save

puts new_product_no_cat.inspect

#Find a specific category and then use it to locate all the the associated products over a certain price.

specific_price =


#Find a specific category and then use it to locate all the the associated products over a certain price.
# Find the "Beverages" category from the collection
beverages_category = Category.find_by(name: "Beverages")

# If the category is found, proceed to locate associated products over a certain price
if beverages_category
  # Define the price threshold
  price_threshold = 300.0

  # Locate associated products over the price threshold
  products_over_price = beverages_category.products.where("price > ?", price_threshold)

  if products_over_price.any?
    puts "Products in 'Beverages' category with price over $#{price_threshold}:"
    products_over_price.each do |product|
      puts "#{product.name}: $#{product.price}"
    end
  else
    puts "No products found in 'Beverages' category with price over $#{price_threshold}."
  end
else
  puts "Category 'Beverages' not found."
end; nil
