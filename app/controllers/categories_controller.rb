class CategoriesController < ApplicationController
  def index 
    @category = Category.all
    @book = Book.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
