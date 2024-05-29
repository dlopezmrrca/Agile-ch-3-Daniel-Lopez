require_relative 'ar.rb'

#Find all the categories in the database (including those that you added using Faker).
categories = Category.includes(:products).all

# Display the categories and their products in a nicely formatted list.
categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  Product: #{product.name}, Price: $#{'%.2f' % product.price}"
  end
  puts "\n"
end; nil
