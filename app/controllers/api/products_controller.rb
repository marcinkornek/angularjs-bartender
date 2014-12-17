class Api::ProductsController < ApplicationController
  before_action :require_login
  before_action :check_if_admin, except: [:index, :show, :search_results, :search_product_names]

  def index
    orders = OrderDetail.all.order(created_at: :desc)
    recent_products = orders.map(&:product).uniq.take(12).extend(ProductsRepresenter)
    products = if !params[:category].blank?
      Product.send(params[:category]).order(:name).extend(ProductsRepresenter)
    else
      Product.all.order(:name).extend(ProductsRepresenter)
    end
    render json: {products: products.to_hash, results: products.size, category: params[:category], recent_products: recent_products.to_hash}
  end

  def show
    product_details = product.product_details.map do |pd|
      {
        id: pd.id,
        size: pd.size,
        price: pd.price.to_f,
      }
    end
    render json: { product: product.extend(ProductRepresenter).to_hash, product_details: product_details  }
  end

  def create
    # p '-----------------'
    # p product_params
    # p '-----------------'
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render json: @product, status: :not_acceptable
    end
  end

  def update
    product_details_ids = product_params[:product_details_attributes].map {|pda| pda[:id]}
    product.delete_nested_attr(product_details_ids)
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
        products: Product.send(category).search(params[:query]).extend(ProductsRepresenter).to_hash,
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
    params.permit(:category, :name, :description, :image, :size_type, details: [:id, :size, :price]).tap do |hash|
      hash[:product_details_attributes] = hash.delete(:details)
    end
  end

end


  # def product_params
  #   params.permit(:category, :name, :description, :image, :size_type).tap do |hash|
  #     hash[:product_detail_attributes] = params[:details][:size, :price]
  #   end
  # end
