vendor = Vendor.create(first_name: "Ajanta", last_name: "Interprice", email: "ajantainterprice@gmail.com")

customer = Customer.create(first_name: "Akash", last_name: "Sharma", email: "akashsharma@gmail.com")

products = (1..5).map do |i|
  vendor.products.create(name: Faker::Commerce.product_name, brand_name: "Tykoo")
end


products.each do |product|
  (1..5).each do |i|
    product.product_variants.create(length: i*2, width: i*2-(i*2)/2)
  end
end


