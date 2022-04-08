# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

User.create(
  name: "John",
  email: "john@gmail.com",
  age: 22,
  gender: "male"
)

User.create(
  name: "Alexandra",
  email: "alexandra@gmail.com",
  age: 20,
  gender: "female"
)

User.create(
  name: "Dan",
  email: "dan@gmail.com",
  age: 25,
  gender: "male"
)

User.create(
  name: "Maria",
  email: "maria@gmail.com",
  age: 18,
  gender: "female"
)

User.create(
  name: "Andrei",
  email: "andrei@gmail.com",
  age: 19,
  gender: "other"
)
