# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
User.create!([
  { name: "John", email: 'john_smith@gmail.com', password: '12345567890' },
  { name: "Ivan", email: 'ivan_young@gmail.com', password: 'test123' },
  { name: "Antonio", email: 'antonio_costa@gmail.com', password: 'test_test' }
])