class SearchesController < ApplicationController
  def index
    @books = nil
  end
  
  def book
    @word = params[:q] #検索ワード
    uri = URI.parse("https://www.googleapis.com/books/v1/volumes?q="+@word)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    @books = json["items"]

    render "index"
  end

  def new 
    #基本情報を追加してメモなどを書きたせるようなeditのイメージ
  end

  def create
  end
  

end
