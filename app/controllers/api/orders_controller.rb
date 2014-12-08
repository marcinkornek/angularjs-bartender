class Api::OrdersController < ApplicationController

  def index
    orders = Order.all.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 10).map do |o|
      {
        bartender: o.bartender.username,
        updated: o.updated_at,
        total_price: o.total_price,
        id: o.id
      }
    end
    render json: { orders: orders, number: Order.count}
  end

  def create
    # p '-----------------'
    # p params
    # p '-----------------'
    if session[:order]
      order = Order.find(session[:order])
    else
      order = Order.create(bartender: current_user)
      session[:order] = order.id
      order
    end
    product = Product.find(params[:id])
    order_detail = OrderDetail.new(order: order, product: product, amount: params[:amount], price: params[:price], size_type: product.size_type, size: params[:size])
    if order_detail.save
      render json: order_detail
    else
      render json: order_detail, status: :not_acceptable
    end
  end

  def last_orders
    orders = OrderDetail.all.order(created_at: :desc)
    render json: orders.map(&:product).uniq
  end

  def order_summary
    session_order = session[:order] || session[:closed_order] || params[:id]
    session_items(session_order)
    session.delete(:closed_order)
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
          size_type: od.size_type,
          size: od.size,
          amount: od.amount,
          id: od.id
        }
      end
      render json: { items: items, total_price: order.total_price, state: order.state, id: order.id }
    else
      render json: {}
    end
  end

end

