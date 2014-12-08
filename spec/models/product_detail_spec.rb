require 'spec_helper'

describe ProductDetail do
  before do
    @product_detail = FactoryGirl.create(:product_detail)
  end

  it { expect(@product_detail).to respond_to(:size) }
  it { expect(@product_detail).to respond_to(:price) }

  it { expect(@product_detail).to be_valid }

  describe "when size is not present" do
    before { @product_detail.size = ''}
    it { expect(@product_detail).not_to be_valid }
  end

  describe "when price is not present" do
    before { @product_detail.price = ''}
    it { expect(@product_detail).not_to be_valid }
  end

end
