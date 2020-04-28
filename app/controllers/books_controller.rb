class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.where("user_id="+ @user.id.to_s).order("id")
  end

  def show
    @book = Book.find( params[:id] )
  end

  def new 
    @user = current_user
    @book = Book.new( file_type: "png" )
  end

  def edit
    @user = current_user
    @book = Book.find( params[:id] )
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to @book , notice: "Success Create"
    else 
      render "new"
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.assign_attributes(params[:book])
    if @book.save
      redirect_to @book, notice: "Success Update!"
    else
      redirect_to "edit"
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :books , notice: "Success Delete!"
  end

end
