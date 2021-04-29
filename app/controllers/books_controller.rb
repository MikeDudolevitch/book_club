class BooksController < ApplicationController

private

    def book_params
        params.require(:books).permit(:name, :author)
    end

end
