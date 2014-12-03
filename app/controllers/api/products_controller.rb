class Api::ProductsController < ApplicationController
  before_action :require_login
  before_action :check_if_admin, except: [:index, :show, :search_results, :search_product_names]

  def index
    orders = OrderDetail.all.order(created_at: :desc)
    recent_products = orders.map(&:product).uniq
    products = if !params[:category].blank?
      Product.send(params[:category]).order(:name)
    else
      Product.all.order(:name)
    end
    render json: {products: products, results: products.size, category: params[:category], recent_products: recent_products}
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

  def update
    render json: product.update_attributes(product_params)
  end

  def destroy
    render json: product.destroy
  end

  def search_product_names
    product_names = Product.search(params[:query]).map(&:name).uniq
    render json: product_names
  end

  def search_results
    results = Product.all.search(params[:query]).size
    search_results = Product.all.search(params[:query])
    sr = search_results.map(&:category).uniq.map do |category|
      {
        products: Product.send(category).search(params[:query]),
        results: Product.send(category).search(params[:query]).size,
        category: category
      }
    end
    render json: { search_results: sr, results: results }
  end

  def image_upload
    if @product = Product.all.order(:updated_at).last.update_attributes(image: params[:file])
      render json: @product
    else
      render json: @product.errors, status: :not_acceptable
    end
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

