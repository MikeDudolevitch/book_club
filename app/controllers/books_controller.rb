class BooksController < ApplicationController

    def new
        redirect_if_not_logged_in
        @club = Club.find(params[:club_id])
        if @club
            @book = @club.books.build
        else 
            @book = Book.new
        end
    end

    def show
        redirect_if_not_logged_in
        @book = Book.find_by_id(params[:id]) 
    end

    def index
        redirect_if_not_logged_in
        @books = Book.all
    end

    def create
        redirect_if_not_logged_in
        @book = Book.create(book_params)
        @club = Club.find(params[:club_id])
        binding.pry
        if @book.save 
            @clubbook = ClubBook.create(club_id: @club.id, book_id: @book.id, timetable: params[:timetable])
            redirect_to club_path(@club)
        else
            flash[:message] = "Did Not Save Book"
            render :new
        end
    end

    def recent_books
        redirect_if_not_logged_in
        @books = Book.newest_books
        render 'index'
    end


private

    def book_params
        params.require(:book).permit(:name, :author)
    end

end
