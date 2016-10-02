class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)

    if book.save
      flash.now[:success] = "Book successfully saved"
      redirect_to books_url
      flash
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
  end

  def destroy
    book = Book.find_by_id(params[:id])

    if book.destroy
      redirect_to books_url
    else
      flash.now[:errors] = book.errors.full_messages
      redirect_to books_url
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
