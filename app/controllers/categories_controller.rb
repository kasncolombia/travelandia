class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:subcategories).all
  end

  def show
    @category = Category.find_by!(slug: params[:slug])
    @subcategories = @category.subcategories
  end

  def subcategory
    @category = Category.find_by!(slug: params[:category_slug])
    @subcategory = @category.subcategories.find_by!(slug: params[:slug])
    @sibling_subcategories = @category.subcategories.where.not(id: @subcategory.id)
  end
end
