class Api::OrdersController < ApplicationController

  def index
    @order = Order.all
    render json: @order
  end

  def show
    @order = Order.find(session[:order])
    items = @order.order_details.map do |od|
      {
        item: od.orderable,
        price: od.price,
        amount: od.amount
      }
    end
    render json: items
  end

  def create
    p '-----------------'
    p session[:order]
    p '-----------------'
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

  def close_order
    session.delete[:order]

  end

  def update
    render json: order.update_attributes(order_params)
  end

  def destroy
    render json: order.destroy
  end



  ###################################################

  private

  def order
    @order ||= Order.find(params[:id])
  end

  def orderable_type
    if Category.pluck(:name).include?(params[:type].downcase)
      params[:type].constantize
    else
      raise "error"
    end
  end



  # def order_params
  #   params.permit(order)
  # end

end

