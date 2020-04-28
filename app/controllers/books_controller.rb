class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.where("user_id="+ @user.id.to_s).order("id")
  end

  def show
    @book = Book.find( params[:id] )
  end

end
