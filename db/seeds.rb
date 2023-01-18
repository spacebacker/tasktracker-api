# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
User.create!([
  { name: "John", email: 'john_smith@gmail.com', password: 'test123' },
  { name: "Ivan", email: 'ivan_young@gmail.com', password: 'test123' },
  { name: "Antonio", email: 'antonio_costa@gmail.com', password: 'test123' },
  { name: "Adrienne", email: 'adrienne_lockman@lindgren.co', password: 'test123' },
  { name: "Lamar", email: 'lamar.crona@veum.biz', password: 'test123' },
  { name: "Rufus", email: 'rufus.reilly@reichert.co', password: 'test123' },
  { name: "Edward", email: 'edward@auer.info', password: 'test123' },
  { name: "Lona", email: 'lona@hyatt.org', password: 'test123' },
  { name: "Lelia", email: 'lelia.zulauf@mckenzie-hane.io', password: 'test123' },
  { name: "Terrell", email: 'terrell@kris.com', password: 'test123' },
])
