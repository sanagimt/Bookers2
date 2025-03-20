class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        redirect_to book_path(@book.id)
    else
        render :index
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(@user.id)
    end

    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save 
      redirect_to user_path(@user.id)
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
