require 'spec_helper'

describe Product do

  before do
    @product = FactoryGirl.create(:product)
  end

  it { expect(@product).to respond_to(:name) }
  it { expect(@product).to respond_to(:description) }
  it { expect(@product).to respond_to(:image) }
  it { expect(@product).to respond_to(:category) }
  it { expect(@product).to respond_to(:size_type) }
  it { expect(@product).to respond_to(:product_details) }

  it { expect(@product).to be_valid }

  describe "when name is not present" do
    before { @product.name = ''}
    it { expect(@product).not_to be_valid }
  end

  describe "when description is not present" do
    before { @product.description = ''}
    it { expect(@product).to be_valid }
  end

  describe "when category is not present" do
    before { @product.category = ''}
    it { expect(@product).not_to be_valid }
  end

  describe "when size_type is not present" do
    before { @product.size_type = ''}
    it { expect(@product).not_to be_valid }
  end

  # describe "when image is not present" do
  #   before { @product.image = '' }
  #   it { expect(@product).not_to be_valid }
  # end

  describe "email name with mixed case" do
    let(:mixed_case_name) { "bEEr" }

    it "should be saved capitalized" do
      @product.name = mixed_case_name
      @product.save
      expect(@product.reload.name).to eq mixed_case_name.capitalize
    end
  end

  describe "when size_type is" do
    context "from the list" do
      it "should be valid" do
        size_types = %w(milliliters grams size)
        size_types.each do |st|
          @product.size_type = st
          expect(@product).to be_valid
        end
      end
    end
    context "out the list" do
      it "should not be valid" do
        size_types = %w(kilometer kilogram amount)
        size_types.each do |st|
          @product.size_type = st
          expect(@product).not_to be_valid
        end
      end
    end
  end

  describe "when category is" do
    context "from the list" do
      it "should be valid" do
        categories = %w(food drinks alcohol snacks)
        categories.each do |c|
          @product.category = c
          expect(@product).to be_valid
        end
      end
    end
    context "out the list" do
      it "should not be valid" do
        categories = %w(kilometer kilogram amount)
        categories.each do |c|
          @product.category = c
          expect(@product).not_to be_valid
        end
      end
    end
  end

  describe "#search" do
    before do
      Product.destroy_all
      FactoryGirl.create(:product, name: "PizZa")
      FactoryGirl.create(:product, name: "Pasta")
      FactoryGirl.create(:product, name: "Pizza fungi")
      FactoryGirl.create(:product, name: "new pizza fungi")
    end
    it do
      expect(Product.search('p').count).to         eq 4
      expect(Product.search('pizza').count).to     eq 3
      expect(Product.search('pasta').count).to     eq 1
      expect(Product.search('hamburger').count).to eq 0
    end
  end

  describe "scopes" do
    before do
      Product.destroy_all
      2.times { FactoryGirl.create(:product, category: "food") }
      3.times { FactoryGirl.create(:product, category: "drinks") }
      4.times { FactoryGirl.create(:product, category: "alcohol") }
      5.times { FactoryGirl.create(:product, category: "snacks") }
    end
    it do
      expect(Product.food.count).to     eq 2
      expect(Product.drinks.count).to   eq 3
      expect(Product.alcohol.count).to  eq 4
      expect(Product.snacks.count).to   eq 5
    end
  end

  describe "#delete_nested_attr" do
    before do
      4.times { FactoryGirl.create(:product_detail, product: @product) }
      @pd = @product.product_details.map(&:id)
      @count = @product.product_details.count
      @pd.pop
    end

    it do
      @product.delete_nested_attr(@pd)
      expect(@product.product_details.count).to eq @count - 1
    end
  end

end
