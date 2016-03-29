RSpec.describe VisitorsController, type: :controller do
	describe "GET #index" do
  		it "@product is alphabetical" do
    		get :index
    		product1, product2 = Product.create!, Product.create!
    		@product = Product.all.alphabetical
    products = [product3, product2, product1]
    expect(Product.alphabetical).to eq products
  end
end