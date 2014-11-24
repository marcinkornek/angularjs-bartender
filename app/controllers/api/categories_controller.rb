class Api::CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(id: :asc)
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

  def current_user?
    unless current_user == post.user
      render json: {error: 'unpermited user'}, status: :not_acceptable
    end
  end

end

