class BooksController < ApplicationController
  def index
    @categories = Category.all
    @books = Book.all
    @books = @books.includes(:categories).where(categories: { id: params[:category_id] }) if params[:category_id]
  end

  def show
    @books = Book.find(params[:id])
  end

  private

  def index_params
    params.permit(:category_id)
  end
end
