class Api::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: category
  end

  ###################################################

  private

  def category
    @category ||= Category.find(params[:id])
  end

end

