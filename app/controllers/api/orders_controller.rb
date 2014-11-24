class Api::OrderController < ApplicationController

  def index
    @order = Order.all
    render json: @order
  end

  def show
    render json: order
  end

  def create
    @order = session[:order] || Order.create(bartender: current_user)
    session[:order] = @order.id
    p '-----------------'
    p params
    p '-----------------'
    # order_details = OrderDetail.create()
    # if @post.save
    #   render json: @post
    # else
    #   render json: @post, status: :not_acceptable
    # end
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

end

