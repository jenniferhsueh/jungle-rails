require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before (:each) do
      @category = Category.create(:name => "Shoes")     
    end

    it "product should save successfully" do
      @product = @category.products.create(:name => "Heels", :price => 5, :quantity => 1)
      expect(@product).to be_present
    end
    
    it "insist on a valid category" do
      @product = Product.create(:name => "Heels", :price => 5, :quantity => 1, :category => nil)
      expect(@product).not_to be_valid
    end

    it "insist on a valid price" do
      @product = @category.products.create(:name => "Heels", :price => nil, :quantity => 1)
      @product.valid?
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    
    it "insist on a valid quantity" do
      @product = @category.products.create(:price => 5, :quantity => nil)
      # puts @product.errors.full_messages[0]
      # puts @product.errors.full_messages[1]
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "insist on a valid name" do
      @product = @category.products.create(:name => nil, :price => 5, :quantity => 1)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  end
end
