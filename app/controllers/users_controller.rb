class UsersController < ApplicationController
  def index
    @user = User.new()
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end
  
  def edit
  end
 
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "Success User"
    else
      render "new"
    end
  end

  def update
  end
  
  def destroy
    
  end

end
