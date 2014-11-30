class Api::ProductsController < ApplicationController
  before_action :require_login
  before_action :check_if_admin, except: [:index, :show]

  def index
    @product = if !params[:category].empty?
      Product.send(params[:category])
    else
      Product.all
    end
    render json: @product
  end

  def show
    render json: product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render json: @product, status: :not_acceptable
    end
  end

  def image_upload
    if @product = Product.all.order(:updated_at).last.update_attributes(image: params[:file])
      render json: @product
    else
      render json: @product.errors, status: :not_acceptable
    end
  end

  def update
    render json: product.update_attributes(product_params)
  end

  def destroy
    render json: product.destroy
  end

  ###################################################

  private

  def product
    @product ||= Product.find(params[:id])
  end

  def product_params
    params.permit(:product_type, :category, :name, :size, :price, :description, :image)
  end

end

