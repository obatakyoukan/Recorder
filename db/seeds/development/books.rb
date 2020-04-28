titles = %w(a  b  c d )
authors = ["apple" , "lemon"]
publishers = [ nil , "zihi"]
publisheds = [ "today" , "tommorow"]
memoes = [ "OK" , "Good!", "Bad..." ]

0.upto(3) do |idx|
  Book.create(
    user_id: 1,
    title: titles[idx],
    author: authors[idx%2],
    publisher: publishers[idx%2],
    published: publisheds[idx%2],
    memo: memoes[idx%3],
    file_type: "png",
    file_url: "http://books.google.com/books/content?id=48swDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
    link: "http://books.google.com/books/content?id=48swDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
  )
end
