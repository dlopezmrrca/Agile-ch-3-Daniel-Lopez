require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40.
greater_than_40 = Product.where('stock_quantity > ?', 40)

# Add one to the stock quantity of each of these products and then save these changes to the database.
greater_than_40.each do |product|
  product.stock_quantity += 1
  product.save
end; nil

# Output the updated products
greater_than_40.each do |product|
  puts "Product ID: #{product.id}, Name: #{product.name}, New Stock Quantity: #{product.stock_quantity}"
end; nil
