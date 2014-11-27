class Api::OrdersController < ApplicationController

  def index
    orders = Order.all.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 10).map do |o|
      {
        bartender: o.bartender.username,
        updated: o.updated_at,
        total_price: o.total_price
      }
    end
    render json: { orders: orders, number: Order.count}
  end

  def order_summary
    session_order = session[:order] || session[:closed_order]
    session_items(session_order)
    session.delete(:closed_order)
  end

  def create
    if session[:order]
      @order = Order.find(session[:order])
    else
      @order = Order.create(bartender: current_user)
      session[:order] = @order.id
      @order
    end
    price = params[:price].to_f * params[:amount].to_i
    item = orderable_type.find(params[:id])
    order_detail = OrderDetail.new(order: @order, orderable: item, amount: params[:amount], price: price)
    if order_detail.save
      render json: order_detail
    else
      render json: order_detail, status: :not_acceptable
    end
  end

  def order_close
    session[:closed_order] = session[:order]
    Order.find(session[:order]).close_order
    render json: session.delete(:order)
  end

  def order_destroy
    render json: Order.all.order(:updated_at).last.destroy
    session.delete(:closed_order)
    session.delete(:order)
  end

  def order_detail_destroy
    render json: Order.all.order(:updated_at).last.order_details.find(params[:orderId]).destroy
  end

  ###################################################

  private

  def orderable_type
    if Category.pluck(:name).include?(params[:type].downcase)
      params[:type].constantize
    else
      raise "error"
    end
  end

  def session_items(session_order)
    if session_order
      order = Order.find(session_order)
      order.set_total_price
      items = order.order_details.map do |od|
        {
          item: od.product,
          price: od.price,
          amount: od.amount,
          id: od.id
        }
      end
      render json: { items: items, total_price: order.total_price, state: order.state }
    else
      render json: {}
    end
  end

end

