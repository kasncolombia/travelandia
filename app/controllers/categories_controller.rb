class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:subcategories).all
  end

  def show
    @category = Category.find_by!(slug: params[:slug])
    @subcategories = @category.subcategories
  end
end
