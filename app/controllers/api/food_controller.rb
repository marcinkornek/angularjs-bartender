class Api::FoodController < ApplicationController

  def index
    @food = Food.all
    render json: @food
  end

  def show
    render json: food
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      render json: @food
    else
      render json: @food, status: :not_acceptable
    end
  end

  def image_upload
    if @food = Food.all.order(:updated_at).last.update_attributes(image: params[:file])
      render json: @food
    else
      render json: @food.errors, status: :not_acceptable
    end
  end

  def update
    render json: food.update_attributes(food_params)
  end

  def destroy
    render json: food.destroy
  end

  ###################################################

  private

  def food
    @food ||= Food.find(params[:id])
  end

  def food_params
    params.permit(:name, :size, :price, :image)
  end

end

