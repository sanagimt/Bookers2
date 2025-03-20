class BooksController < ApplicationController

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to book_path(@book.id)
        else
            @books = Book.all.order(id: :asc)
            render :index
        end

    end

    def index
        @books = Book.all
        @book = Book.new
        @user = current_user
    end

    def show
        @newbook = Book.new
        @book = Book.find(params[:id])
        @user = @book.user

    end


    def edit

    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end


end
