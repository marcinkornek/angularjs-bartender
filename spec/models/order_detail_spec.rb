require 'spec_helper'

describe OrderDetail do
  before do
    @order_detail = FactoryGirl.create(:order_detail)
  end

  it { expect(@order_detail).to respond_to(:product) }
  it { expect(@order_detail).to respond_to(:order) }
  it { expect(@order_detail).to respond_to(:amount) }
  it { expect(@order_detail).to respond_to(:size_type) }
  it { expect(@order_detail).to respond_to(:size) }
  it { expect(@order_detail).to respond_to(:price) }

  it { expect(@order_detail).to be_valid }

  describe "when product is not present" do
    before { @order_detail.product = nil}
    it { expect(@order_detail).not_to be_valid }
  end

  describe "when order is not present" do
    before { @order_detail.order = nil}
    it { expect(@order_detail).not_to be_valid }
  end

  describe "when amount is not present" do
    before { @order_detail.amount = ''}
    it { expect(@order_detail).not_to be_valid }
  end

  describe "when size_type is not present" do
    before { @order_detail.size_type = ''}
    it { expect(@order_detail).not_to be_valid }
  end

  describe "when size is not present" do
    before { @order_detail.size = ''}
    it { expect(@order_detail).not_to be_valid }
  end

  describe "when price is not present" do
    before { @order_detail.price = ''}
    it { expect(@order_detail).not_to be_valid }
  end

  describe "when amount is" do
    context "bigger than 0" do
      before { @order_detail.amount = 1 }
      it { expect(@order_detail).to be_valid }
    end
    context "equal 0" do
      before { @order_detail.amount = 0 }
      it { expect(@order_detail).not_to be_valid }
    end
    context "smaller than 0" do
      before { @order_detail.amount = -1 }
      it { expect(@order_detail).not_to be_valid }
    end
  end

end
