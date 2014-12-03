class Api::ProductsController < ApplicationController
  before_action :require_login
  before_action :check_if_admin, except: [:index, :show, :search_results, :search_product_names]

  def index
    p '-----------------'
    p params
    p '-----------------'
    @product = if !params[:category].blank?
      Product.send(params[:category]).order(:name)
    else
      Product.all.order(:name)
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
    food =   { products: Product.food.search(params[:query]), category: 'food' }
    drinks = { products: Product.drinks.search(params[:query]), category: 'drinks' }
    alcohol = { products: Product.alcohol.search(params[:query]), category: 'alcohol' }
    snacks = { products: Product.snacks.search(params[:query]), category: 'snacks' }
    results = Product.all.search(params[:query]).size
    render json: { food: food, drinks: drinks, snacks: snacks, alcohol: alcohol, results: results }
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

