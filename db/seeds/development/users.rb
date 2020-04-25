names = %w(root obata)
passwords = ["pass", "norihiro"]
0.upto(2) do |idx|
  User.create(
    name: names[idx],
    password: passwords[idx],
    password_confirmation: passwords[idx]
  )
end
