# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'test@test.com',
			password: 'test100',
			password_confirmation: 'test100',
			first_name: 'Gloob',
			last_name: 'Glob',
			role: User.roles[:admin])
User.create(email: 'test0@test.com',
			password: 'test100',
			password_confirmation: 'test100',
			first_name: 'Sloob',
			last_name: 'Slob',
			role: User.roles[:admin])
User.create(email: 'test1@test.com',
			password: 'test100',
			password_confirmation: 'test100',
			first_name: 'Bloob',
			last_name: 'Blob')
User.create(email: 'test2@test.com',
			password: 'test100',
			password_confirmation: 'test100',
			first_name: 'Floob',
			last_name: 'Flob')
User.create(email: 'test3@test.com',
			password: 'test100',
			password_confirmation: 'test100',
			first_name: 'Kloob',
			last_name: 'Klob')

10.times do |x|
	client = Client.create(first_name: "Monsieur #{x}",
						   					 last_name: "Laba",
						   					 company: "Empresa #{x}",
						   					 user_id: User.first.id )
end