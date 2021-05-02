class BooksController < ApplicationController

    def new
        if @club
            @book = @club.books.build
        else 
            @book = Book.new
        end
    end

    def show
        @book = Book.find_by_id(params[:id])
    end

    def index
        @books = Book.all
    end

    def create
        @book = Book.new(book_params)
        if @book.save 
            redirect_to book_path(@book)
        else
            flash[:message] = "Did Not Save Book"
            render :new
        end
    end

private

    def book_params
        params.require(:book).permit(:name, :author)
    end

end
