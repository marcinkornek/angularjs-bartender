require 'spec_helper'

describe Order do
  before do
    @order         = FactoryGirl.create(:order)
    @order_detail  = FactoryGirl.create(:order_detail, order: @order, amount: 2, price: 20)
    @order_detail2 = FactoryGirl.create(:order_detail, order: @order, amount: 1, price: 20)
  end

  it { expect(@order).to respond_to(:bartender) }
  it { expect(@order).to respond_to(:total_price) }
  it { expect(@order).to respond_to(:state) }
  it { expect(@order).to respond_to(:order_details) }
  it { expect(@order).to be_valid }

  describe "#set_total_price" do
    context "before #set_total_price" do
      it { expect(@order.total_price.to_f).to eq 0 }
    end
    context "after #set_total_price" do
      before { @order.set_total_price }
      it { expect(@order.total_price.to_f).to eq 40 }
    end
  end

  describe "#close_order" do
    context "before #close_order" do
      it { expect(@order.state).to eq 'opened' }
    end
    context "before #close_order" do
      before { @order.close_order }
      it { expect(@order.state).to eq 'closed' }
    end
  end

end
