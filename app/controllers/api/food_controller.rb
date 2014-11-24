class Api::FoodController < ApplicationController

  def index
    @food = Food.all
    render json: @food
  end

  def show
    render json: food
  end

  ###################################################

  private

  def food
    @food ||= Food.find(params[:id])
  end

end

