
class SearchesController < ApplicationController
  def index
    @books = nil
  end
  
  def book
    @word = params[:q] #検索ワード
    uri = URI.parse( URI.encode("https://www.googleapis.com/books/v1/volumes?q="+@word) )
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    @books = json["items"]

    render "index"
  end



  def edit 
    #基本情報を追加してメモなどを書きたせるようなeditのイメージ
    @user = current_user
    @id = params[:id]
    @word = params[:q]

    uri = URI.parse( URI.encode("https://www.googleapis.com/books/v1/volumes?q="+@word) )
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    
    @data = json["items"][ @id.to_i ]
    @title = @data["volumeInfo"]["title"].present? ? @data["volumeInfo"]["title"] : "-"
    @author = @data["volumeInfo"]["authors"].present? ? @data["volumeInfo"]["authors"].join(' , ') : "-"
    @publisher = @data["volumeInfo"]["publisher"].present? ? @data["volumeInfo"]["publisher"] : "-"
    @published = @data["volumeInfo"]["publishedDate"].present? ? @data["volumeInfo"]["publishedDate"] : Time.current
    @file_url = ( @data["volumeInfo"]["imageLinks"].present? and @data["volumeInfo"]["imageLinks"]["smallThumbnail"].present? ) ? @data["volumeInfo"]["imageLinks"]["smallThumbnail"] : ""
    @link = @data["volumeInfo"]["infoLink"].present? ? @data["volumeInfo"]["infoLink"] : ""
    @book = Book.new(
      user_id: current_user,
      title: @title,
      author: @author,
      publisher: @publisher,
      published: @published,
      memo: "",
      file_type: "png",
      file_url: @file_url,
      link: @link,
    )

  end

  def create
  end
  

end
