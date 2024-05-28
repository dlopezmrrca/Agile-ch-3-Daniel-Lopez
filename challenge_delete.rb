require_relative 'ar.rb'

killer = Product.where(:name => 'Tortrix').first

# In the above statement we have to call .first to get a single
# customer object. Without the .first we will get a collection
# of objects. In this case it will likely be a collection of
# size 1.

puts killer.inspect

# Deleting the customer is as simple as calling .destroy

killer.destroy  unless killer.nil?

puts killer.inspect

# The total should be 0
Product.where(:name => 'Tortrix').count
