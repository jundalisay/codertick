require 'rails_helper'

RSpec.describe Category, type: :model do
end

RSpec.describe Product, type: :model do
  it "Alphabetical order should happen" do
    product1 = Product.create(name:"hij pproduct", description:"lorem ispum dolor") 
    product2 = Product.create(name:"efg pproduct", description:"lorem ispum dolor") 
    product3 = Product.create(name:"abc pproduct", description:"lorem ispum dolor")
    products = [product3, product2, product1]
    expect(Product.alphabetical).to eq products
  end
end