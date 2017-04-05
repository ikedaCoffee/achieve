100.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
            name: "ユーザ#{n + 1}",
            password: password,
            password_confirmation: password,
    )
end

m = 1
while m <= 100
  Blog.create(
    title: "ユーザID: #{m}",
    content: "ユーザIDは#{m}です",
    user_id: m,
  )
  m += 1
end