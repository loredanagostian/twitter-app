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
  gender: "male",
  phone_number: "2092006491"
)

User.create(
  name: "Alexandra",
  email: "alexandra@gmail.com",
  age: 20,
  gender: "female",
  phone_number: "2092020546"
)

User.create(
  name: "Dan",
  email: "dan@gmail.com",
  age: 25,
  gender: "male",
  phone_number: "2092088335"
)

User.create(
  name: "Maria",
  email: "maria@gmail.com",
  age: 18,
  gender: "female",
  phone_number: "2092132138"
)

User.create(
  name: "Andrei",
  email: "andrei@gmail.com",
  age: 19,
  gender: "other",
  phone_number: "2092126766"
)
